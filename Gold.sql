USE SupplyChainDWH
GO

CREATE SCHEMA Gold
GO

------ Create Gold.DimCustomers ------

CREATE TABLE Gold.DimCustomers
(
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Id INT,
    Customer_Fname VARCHAR(100),
    Customer_Lname VARCHAR(100),
    Customer_Full_Name VARCHAR(250),
    Customer_Email VARCHAR(255),
    Customer_Segment VARCHAR(50),
    Customer_City VARCHAR(100),
    Customer_State VARCHAR(100),
    Customer_Street VARCHAR(200),
    Customer_Zipcode VARCHAR(20),
    Customer_Country VARCHAR(100),
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    Customer_Birth_Date DATE
);
GO

------ Load Gold.DimCustomers ------

INSERT INTO Gold.DimCustomers
(
    Customer_Id,
    Customer_Fname,
    Customer_Lname,
    Customer_Full_Name,
    Customer_Email,
    Customer_Segment,
    Customer_City,
    Customer_State,
    Customer_Street,
    Customer_Zipcode,
    Customer_Country,
    Latitude,
    Longitude,
    Customer_Birth_Date
)
SELECT
    Customer_Id,
    Customer_Fname,
    Customer_Lname,
    CONCAT(Customer_Fname, ' ', Customer_Lname),
    Customer_Email,
    Customer_Segment,
    Customer_City,
    Customer_State,
    Customer_Street,
    Customer_Zipcode,
    Customer_Country,
    Latitude,
    Longitude,
    Customer_Birth_Date
FROM Silver.Customers;
GO

------ Create Gold.DimProducts ------

CREATE TABLE Gold.DimProducts
(
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,
    Product_Card_Id INT,
    Product_Name VARCHAR(200),
    Product_Price DECIMAL(18,2),
    Product_Status VARCHAR(50),
    Product_Description VARCHAR(500),
    Category_Id INT,
    Category_Name VARCHAR(200),
    Department_Id INT,
    Department_Name VARCHAR(200)
);
GO

------ Load Gold.DimProducts ------

INSERT INTO Gold.DimProducts
(
    Product_Card_Id,
    Product_Name,
    Product_Price,
    Product_Status,
    Product_Description,
    Category_Id,
    Category_Name,
    Department_Id,
    Department_Name
)
SELECT
    Product_Card_Id,
    Product_Name,
    Product_Price,
    Product_Status,
    Product_Description,
    Category_Id,
    Category_Name,
    Department_Id,
    Department_Name
FROM Silver.Products;
GO

------ Create Gold.DimSalesman ------

CREATE TABLE Gold.DimSalesman
(
    Salesman_Key INT IDENTITY(1,1) PRIMARY KEY,
    Salesman_Id INT,
    Salesman_Fname VARCHAR(100),
    Salesman_Lname VARCHAR(100),
    Salesman_Full_Name VARCHAR(250),
    Salesman_Email VARCHAR(255),
    Market VARCHAR(100),
    Region VARCHAR(100),
    Hire_Date DATE,
    Commission_Rate DECIMAL(18,4)
);
GO

------ Load Gold.DimSalesman ------

INSERT INTO Gold.DimSalesman
(
    Salesman_Id,
    Salesman_Fname,
    Salesman_Lname,
    Salesman_Full_Name,
    Salesman_Email,
    Market,
    Region,
    Hire_Date,
    Commission_Rate
)
SELECT
    Salesman_Id,
    Salesman_Fname,
    Salesman_Lname,
    CONCAT(Salesman_Fname, ' ', Salesman_Lname),
    Salesman_Email,
    Market,
    Region,
    Hire_Date,
    Commission_Rate
FROM Silver.Salesman;
GO

------ Create Gold.DimDate ------

CREATE TABLE Gold.DimDate
(
    Date_Key INT PRIMARY KEY,
    Full_Date DATE,
    [Day] INT,
    Day_Name VARCHAR(20),
    Day_Of_Week INT,
    Week_Number INT,
    [Month] INT,
    Month_Name VARCHAR(20),
    [Quarter] INT,
    Quarter_Name VARCHAR(10),
    [Year] INT,
    Year_Month VARCHAR(10),
    Month_Year VARCHAR(20),
    Is_Weekend BIT
);
GO

------ Load Gold.DimDate ------

DECLARE @Date DATE = '2015-01-01';
DECLARE @EndDate DATE = '2015-12-31';
DECLARE @DayOfWeek INT;

WHILE @Date <= @EndDate
BEGIN
    SET @DayOfWeek =
        (DATEDIFF(DAY, '19000101', @Date) % 7) + 1;

    INSERT INTO Gold.DimDate
    (
        Date_Key,
        Full_Date,
        [Day],
        Day_Name,
        Day_Of_Week,
        Week_Number,
        [Month],
        Month_Name,
        [Quarter],
        Quarter_Name,
        [Year],
        Year_Month,
        Month_Year,
        Is_Weekend
    )
    VALUES
    (
        CONVERT(INT, CONVERT(CHAR(8), @Date, 112)),
        @Date,
        DAY(@Date),
        CASE @DayOfWeek
            WHEN 1 THEN 'Monday'
            WHEN 2 THEN 'Tuesday'
            WHEN 3 THEN 'Wednesday'
            WHEN 4 THEN 'Thursday'
            WHEN 5 THEN 'Friday'
            WHEN 6 THEN 'Saturday'
            WHEN 7 THEN 'Sunday'
        END,
        @DayOfWeek,
        DATEPART(ISO_WEEK, @Date),
        MONTH(@Date),
        DATENAME(MONTH, @Date),
        DATEPART(QUARTER, @Date),
        'Q' + CAST(DATEPART(QUARTER, @Date) AS VARCHAR(1)),
        YEAR(@Date),
        CONVERT(CHAR(7), @Date, 120),
        LEFT(DATENAME(MONTH, @Date), 3) + '-' + CAST(YEAR(@Date) AS VARCHAR(4)),
        CASE
            WHEN @DayOfWeek IN (6, 7) THEN 1
            ELSE 0
        END
    );

    SET @Date = DATEADD(DAY, 1, @Date);
END;
GO

------ Create Gold.FactOrders ------

CREATE TABLE Gold.FactOrders
(
    Order_Item_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Key INT,
    Product_Key INT,
    Salesman_Key INT,
    Order_Date_Key INT,
    Shipping_Date_Key INT,
    Order_Id INT,
    Order_Item_Id INT,
    Type VARCHAR(50),
    Delivery_Status VARCHAR(50),
    Late_Delivery_Risk BIT,
    Market VARCHAR(100),
    Order_Region VARCHAR(100),
    Order_State VARCHAR(100),
    Order_Status VARCHAR(50),
    Shipping_Mode VARCHAR(50),
    Order_Zipcode VARCHAR(20),
    Days_For_Shipping_Real INT,
    Days_For_Shipment_Scheduled INT,
    Benefit_Per_Order DECIMAL(18,2),
    Order_Item_Discount DECIMAL(18,2),
    Order_Item_Profit_Ratio DECIMAL(18,4),
    Order_Item_Quantity INT,
    Order_Item_Total DECIMAL(18,2)
);
GO

------ Load Gold.FactOrders ------

INSERT INTO Gold.FactOrders
(
    Customer_Key,
    Product_Key,
    Salesman_Key,
    Order_Date_Key,
    Shipping_Date_Key,
    Order_Id,
    Order_Item_Id,
    Type,
    Delivery_Status,
    Late_Delivery_Risk,
    Market,
    Order_Region,
    Order_State,
    Order_Status,
    Shipping_Mode,
    Order_Zipcode,
    Days_For_Shipping_Real,
    Days_For_Shipment_Scheduled,
    Benefit_Per_Order,
    Order_Item_Discount,
    Order_Item_Profit_Ratio,
    Order_Item_Quantity,
    Order_Item_Total
)
SELECT
    dc.Customer_Key,
    dp.Product_Key,
    ds.Salesman_Key,
    od.Date_Key,
    sd.Date_Key,
    so.Order_Id,
    so.Order_Item_Id,
    so.Type,
    so.Delivery_Status,
    so.Late_delivery_risk,
    so.Market,
    so.Order_Region,
    so.Order_State,
    so.Order_Status,
    so.Shipping_Mode,
    so.Order_Zipcode,
    so.Days_for_shipping_real,
    so.Days_for_shipment_scheduled,
    so.Benefit_per_order,
    so.Order_Item_Discount,
    so.Order_Item_Profit_Ratio,
    so.Order_Item_Quantity,
    so.Order_Item_Total
FROM Silver.Orders so
LEFT JOIN Gold.DimCustomers dc
    ON so.Customer_Id = dc.Customer_Id
LEFT JOIN Gold.DimProducts dp
    ON so.Product_Card_Id = dp.Product_Card_Id
LEFT JOIN Gold.DimSalesman ds
    ON so.Salesman_Id = ds.Salesman_Id
LEFT JOIN Gold.DimDate od
    ON so.Order_Date = od.Full_Date
LEFT JOIN Gold.DimDate sd
    ON so.Shipping_Date = sd.Full_Date;
GO


------ Foreign keys ------

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_FactOrders_DimCustomers
    FOREIGN KEY (Customer_Key) REFERENCES Gold.DimCustomers(Customer_Key);
GO

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_FactOrders_DimProducts
    FOREIGN KEY (Product_Key) REFERENCES Gold.DimProducts(Product_Key);
GO

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_FactOrders_DimSalesman
    FOREIGN KEY (Salesman_Key) REFERENCES Gold.DimSalesman(Salesman_Key);
GO

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_FactOrders_OrderDate
    FOREIGN KEY (Order_Date_Key) REFERENCES Gold.DimDate(Date_Key);
GO

ALTER TABLE Gold.FactOrders
ADD CONSTRAINT FK_FactOrders_ShippingDate
    FOREIGN KEY (Shipping_Date_Key) REFERENCES Gold.DimDate(Date_Key);
GO



SELECT
    MIN(Full_Date) AS MinDate,
    MAX(Full_Date) AS MaxDate,
    COUNT(*) AS DateRows
FROM Gold.DimDate;

SELECT *
FROM Gold.DimDate
ORDER BY Full_Date;
