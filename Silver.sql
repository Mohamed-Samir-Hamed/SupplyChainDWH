USE SupplyChainDWH
GO

CREATE SCHEMA Silver
GO

------ Create Silver Customers ------

CREATE TABLE Silver.Customers
(
    Customer_Id          INT             NOT NULL,     
    Customer_Fname       VARCHAR(100)    NOT NULL,
    Customer_Lname       VARCHAR(100)    NOT NULL,
    Customer_Email       VARCHAR(255)    NULL,        
    Customer_Password    VARCHAR(255)    NULL,       
    Customer_Segment     VARCHAR(50)     NULL,      
    Customer_City        VARCHAR(100)    NULL,
    Customer_State       VARCHAR(100)    NULL,
    Customer_Street      VARCHAR(200)    NULL,
    Customer_Zipcode     VARCHAR(20)     NULL,
    Customer_Country     VARCHAR(100)    NULL,
    Latitude             DECIMAL(9,6)    NULL,       
    Longitude            DECIMAL(9,6)    NULL,
    Customer_Birth_Date  DATE            NULL      
);
GO

------ Create Silver Products ------

CREATE TABLE Silver.Products
(
    Product_Card_Id      INT              NOT NULL,   
    Product_Name         VARCHAR(200)     NOT NULL,
    Product_Price        DECIMAL(18,2)    NULL,       
    Product_Status       VARCHAR(50)      NULL,       
    Product_Description  VARCHAR(500)     NULL,     
    Category_Id          INT              NULL,
    Category_Name        VARCHAR(200)     NULL,
    Department_Id        INT              NULL,
    Department_Name      VARCHAR(200)     NULL
);
GO

------ Create Silver Salesman ------

CREATE TABLE Silver.Salesman
(
    Salesman_Id        INT              NOT NULL,     
    Salesman_Fname     VARCHAR(100)     NOT NULL,
    Salesman_Lname     VARCHAR(100)     NOT NULL,
    Salesman_Email     VARCHAR(255)     NULL,
    Market             VARCHAR(100)     NULL,        
    Region             VARCHAR(100)     NULL,        
    Hire_Date          DATE             NULL,
    Commission_Rate    DECIMAL(18,4)    NULL
);
GO

------ Create Silver Orders ------

CREATE TABLE Silver.Orders
(
    Order_Id                      INT              NOT NULL,   
    Order_Item_Id                 INT              NOT NULL,  
    Customer_Id                   INT              NULL,       
    Product_Card_Id               INT              NULL,       
    Salesman_Id                   INT              NULL,      
    Type                          VARCHAR(50)      NULL,       
    Days_for_shipping_real        INT              NULL,
    Days_for_shipment_scheduled   INT              NULL,
    Benefit_per_order             DECIMAL(18,2)    NULL,
    Delivery_Status               VARCHAR(50)      NULL,     
    Late_delivery_risk            BIT              NULL,      
    Market                        VARCHAR(100)     NULL,
    Order_Region                  VARCHAR(100)     NULL,
    Order_State                   VARCHAR(100)     NULL,
    Order_Status                  VARCHAR(50)      NULL,
    Order_Zipcode                 VARCHAR(20)      NULL,     
    Order_Date                    DATE             NULL,
    Shipping_Date                 DATE             NULL,
    Shipping_Mode                 VARCHAR(50)      NULL,
    Order_Item_Discount           DECIMAL(18,2)    NULL,
    Order_Item_Profit_Ratio       DECIMAL(18,4)    NULL,
    Order_Item_Quantity           INT              NULL,
    Order_Item_Total              DECIMAL(18,2)    NULL
);
GO

------ Load Silver.Customers ------

TRUNCATE TABLE Silver.Customers;
GO

INSERT INTO Silver.Customers
(
    Customer_Id,
    Customer_Fname,
    Customer_Lname,
    Customer_Email,
    Customer_Password,
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
    CAST(NULLIF(LTRIM(RTRIM(Customer_Id)), '') AS INT),
    COALESCE(NULLIF(LTRIM(RTRIM(Customer_Fname)), ''), 'Unknown'),
    COALESCE(NULLIF(LTRIM(RTRIM(Customer_Lname)), ''), 'Unknown'),
    NULLIF(LTRIM(RTRIM(Customer_Email)), ''),
    NULLIF(LTRIM(RTRIM(Customer_Password)), ''),
    NULLIF(LTRIM(RTRIM(Customer_Segment)), ''),
    NULLIF(LTRIM(RTRIM(Customer_City)), ''),
    NULLIF(LTRIM(RTRIM(Customer_State)), ''),
    NULLIF(LTRIM(RTRIM(Customer_Street)), ''),
    NULLIF(LTRIM(RTRIM(Customer_Zipcode)), ''),
    NULLIF(LTRIM(RTRIM(Customer_Country)), ''),
    CAST(NULLIF(LTRIM(RTRIM(Latitude)), '') AS DECIMAL(9,6)),
    CAST(NULLIF(LTRIM(RTRIM(Longitude)), '') AS DECIMAL(9,6)),
    TRY_CONVERT(DATE, NULLIF(LTRIM(RTRIM(Customer_Birth_Date)), ''), 120)
FROM Bronze.Customers;

------ Load Silver.Products ------

TRUNCATE TABLE Silver.Products;
GO

INSERT INTO Silver.Products
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
    CAST(NULLIF(LTRIM(RTRIM(Product_Card_Id)), '') AS INT),
    LTRIM(RTRIM(Product_Name)),
    CAST(NULLIF(LTRIM(RTRIM(Product_Price)), '') AS DECIMAL(18,2)),
    LTRIM(RTRIM(Product_Status)),
    NULLIF(LTRIM(RTRIM(Product_Description)), ''),
    CAST(NULLIF(LTRIM(RTRIM(Category_Id)), '') AS INT),
    LTRIM(RTRIM(Category_Name)),
    CAST(NULLIF(LTRIM(RTRIM(Department_Id)), '') AS INT),
    LTRIM(RTRIM(Department_Name))
FROM Bronze.Products;
GO

------ Load Silver.Salesman ------

TRUNCATE TABLE Silver.Salesman;
GO

INSERT INTO Silver.Salesman
(
    Salesman_Id,
    Salesman_Fname,
    Salesman_Lname,
    Salesman_Email,
    Market,
    Region,
    Hire_Date,
    Commission_Rate
)
SELECT
    CAST(NULLIF(LTRIM(RTRIM(Salesman_Id)), '') AS INT),
    LTRIM(RTRIM(Salesman_Fname)),
    LTRIM(RTRIM(Salesman_Lname)),
    LTRIM(RTRIM(Salesman_Email)),
    LTRIM(RTRIM(Market)),
    LTRIM(RTRIM(Region)),
    TRY_CONVERT(DATE, NULLIF(LTRIM(RTRIM(Hire_Date)), ''), 120),
    CAST(NULLIF(LTRIM(RTRIM(Commission_Rate)), '') AS DECIMAL(18,4))
FROM Bronze.Salesman;
GO

------ Load Silver.Orders ------

TRUNCATE TABLE Silver.Orders;
GO

INSERT INTO Silver.Orders
(
    Order_Id,
    Order_Item_Id,
    Customer_Id,
    Product_Card_Id,
    Salesman_Id,
    Type,
    Days_for_shipping_real,
    Days_for_shipment_scheduled,
    Benefit_per_order,
    Delivery_Status,
    Late_delivery_risk,
    Market,
    Order_Region,
    Order_State,
    Order_Status,
    Order_Zipcode,
    Order_Date,
    Shipping_Date,
    Shipping_Mode,
    Order_Item_Discount,
    Order_Item_Profit_Ratio,
    Order_Item_Quantity,
    Order_Item_Total
)
SELECT

------ IDs & grain ------

    CAST(NULLIF(LTRIM(RTRIM(Order_Id)), '') AS INT)            AS Order_Id,
    CAST(NULLIF(LTRIM(RTRIM(Order_Item_Id)), '') AS INT)       AS Order_Item_Id,
    CAST(NULLIF(LTRIM(RTRIM(Customer_Id)), '') AS INT)         AS Customer_Id,
    CAST(NULLIF(LTRIM(RTRIM(Product_Card_Id)), '') AS INT)     AS Product_Card_Id,
    CAST(NULLIF(LTRIM(RTRIM(salesman_id)), '') AS INT)         AS Salesman_Id,

------ Type ------

    LTRIM(RTRIM(Type))                                         AS Type,

------ Numeric measures ------

    CAST(NULLIF(LTRIM(RTRIM(Days_for_shipping_real)), '') AS INT)
                                                               AS Days_for_shipping_real,
    CAST(NULLIF(LTRIM(RTRIM(Days_for_shipment_scheduled)), '') AS INT)
                                                               AS Days_for_shipment_scheduled,
    CAST(NULLIF(LTRIM(RTRIM(Benefit_per_order)), '') AS DECIMAL(18,2))
                                                               AS Benefit_per_order,

------ Delivery_Status standardized ------

    CASE
        WHEN Delivery_Status IS NULL THEN NULL
        WHEN LTRIM(RTRIM(Delivery_Status)) IN ('Advance Shipping', 'Advance  shipping')
            THEN 'Advance Shipping'
        WHEN LTRIM(RTRIM(Delivery_Status)) IN ('Late  delivery', 'late delivery')
            THEN 'Late Delivery'
        WHEN LTRIM(RTRIM(Delivery_Status)) IN ('Shipping canceled', 'Shipping Canceled', 'Shipping  canceled')
            THEN 'Shipping Canceled'
        WHEN LTRIM(RTRIM(Delivery_Status)) IN ('Shipping on time', 'Shipping On Time', 'Shipping  on time')
            THEN 'Shipping On Time'
        ELSE LTRIM(RTRIM(Delivery_Status))
    END                                                        AS Delivery_Status,

------ Late_delivery_risk as BIT ------

    CASE
        WHEN LTRIM(RTRIM(Late_delivery_risk)) IN ('1','Y','YES','Yes')
            THEN 1
        WHEN LTRIM(RTRIM(Late_delivery_risk)) IN ('0','N','NO','No')
            THEN 0
        ELSE NULL
    END                                                        AS Late_delivery_risk,

------ Market standardized ------

    CASE
        WHEN Market IS NULL THEN NULL
        WHEN LTRIM(RTRIM(Market)) IN ('AFR', 'Africa') THEN 'Africa'
        WHEN LTRIM(RTRIM(Market)) IN ('APAC', 'Asia-Pacific') THEN 'Asia Pacific'
        WHEN LTRIM(RTRIM(Market)) IN ('EU', 'Europe') THEN 'Europe'
        WHEN LTRIM(RTRIM(Market)) IN ('LATAM', 'Latin  America') THEN 'Latin America'
        WHEN LTRIM(RTRIM(Market)) = 'Pacific  Asia' THEN 'Pacific Asia'
        WHEN LTRIM(RTRIM(Market)) IN ('U.S.-Canada', 'US  & Canada', 'US  and Canada', 'USCA', 'US and Canada')
             THEN 'US & Canada'
        ELSE LTRIM(RTRIM(Market))
    END                                                        AS Market,

------ Order_Region – simple cleanup (extend if needed) ------

    CASE
    WHEN Order_Region IS NULL THEN NULL
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Canada') THEN 'Canada'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Caribbean') THEN 'Caribbean'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Central Africa', 'Central  Africa') THEN 'Central Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Central America', 'central america', 'central  america') THEN 'Central America'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Central Asia', 'Central  Asia') THEN 'Central Asia'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('East Africa', 'East  Africa') THEN 'East Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('East of USA', 'east of USA', 'East  of USA') THEN 'East of USA'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Eastern Asia', 'Eastern  Asia') THEN 'Eastern Asia'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Eastern Europe', 'Eastern  Europe') THEN 'Eastern Europe'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('North Africa', 'North  Africa') THEN 'North Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('North of Africa') THEN 'North Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Northern Europe', 'northern europe', 'northern  europe') THEN 'Northern Europe'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Oceania') THEN 'Oceania'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('South America', 'South  America') THEN 'South America'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('South Asia', 'SOUTH ASIA','SOUTH  ASIA') THEN 'South Asia'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('South of USA', 'south of USA', 'SOUTH OF  USA', 'South  of  USA') THEN 'South of USA'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Southeast Asia', 'Southeast  Asia') THEN 'Southeast Asia'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Southern Africa', 'Southern  Africa') THEN 'Southern Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Southern Europe','Southern  Europe') THEN 'Southern Europe'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('US Center', 'us center', 'US  Center') THEN 'US Center'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('West Africa', 'West  Africa') THEN 'West Africa'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('West Asia', 'West  Asia') THEN 'West Asia'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('West of USA', 'west of USA', 'West  of USA') THEN 'West of USA'
    WHEN LTRIM(RTRIM(Order_Region)) IN ('Western Europe', 'Western  Europe') THEN 'Western Europe'
    ELSE LTRIM(RTRIM(Order_Region))
END                                                        AS Order_Region,

------ State ------

    LTRIM(RTRIM(Order_State))                                  AS Order_State,

------ Order_Status standardized ------

    CASE
        WHEN Order_Status IS NULL THEN NULL
        WHEN LTRIM(RTRIM(Order_Status)) IN ('canceled', 'CANCELED')
             THEN 'Canceled'
        WHEN LTRIM(RTRIM(Order_Status)) = 'CLOSED'
             THEN 'Closed'
        WHEN LTRIM(RTRIM(Order_Status)) = 'COMPLETE'
             THEN 'Complete'
        WHEN LTRIM(RTRIM(Order_Status)) IN ('ON_HOLD', 'PENDING')
             THEN 'On Hold'
        WHEN LTRIM(RTRIM(Order_Status)) = 'PAYMENT_REVIEW'
             THEN 'Payment Review'
        WHEN LTRIM(RTRIM(Order_Status)) = 'PENDING_PAYMENT'
             THEN 'Pending Payment'
        WHEN LTRIM(RTRIM(Order_Status)) = 'PROCESSING'
             THEN 'Processing'
        WHEN LTRIM(RTRIM(Order_Status)) = 'SUSPECTED_FRAUD'
             THEN 'Suspected Fraud'
        ELSE LTRIM(RTRIM(Order_Status))
    END                                                        AS Order_Status,

------ Zipcode ------

    NULLIF(LTRIM(RTRIM(Order_Zipcode)), '')                    AS Order_Zipcode,

------ Dates ------

    TRY_CONVERT(DATE, NULLIF(LTRIM(RTRIM(order_date_DateOrders)), ''), 120)
                                                               AS Order_Date,
    TRY_CONVERT(DATE, NULLIF(LTRIM(RTRIM(shipping_date_DateOrders)), ''), 120)
                                                               AS Shipping_Date,

------ Shipping_Mode standardized ------

    CASE
        WHEN Shipping_Mode IS NULL THEN NULL
        WHEN LTRIM(RTRIM(Shipping_Mode)) IN ('First  Class', 'First class', '1st Class', '1st  Class')
             THEN 'First Class'
        WHEN LTRIM(RTRIM(Shipping_Mode)) IN ('Same  Day', 'Same-Day', 'Same Day', 'SAME DAY')
             THEN 'Same Day'
        WHEN LTRIM(RTRIM(Shipping_Mode)) IN ('Second  Class', 'Second class', '2nd Class', '2nd  Class')
             THEN 'Second Class'
        WHEN LTRIM(RTRIM(Shipping_Mode)) IN ('Standard', 'Standard  Class', 'Std Class','Std  Class', 'Standard Class', 'STANDARD CLASS' )
             THEN 'Standard Class'
        ELSE LTRIM(RTRIM(Shipping_Mode))
    END                                                        AS Shipping_Mode,

------ Measures ------

    CAST(NULLIF(LTRIM(RTRIM(Order_Item_Discount)), '') AS DECIMAL(18,2))
                                                               AS Order_Item_Discount,
    CAST(NULLIF(LTRIM(RTRIM(Order_Item_Profit_Ratio)), '') AS DECIMAL(18,4))
                                                               AS Order_Item_Profit_Ratio,
    CAST(NULLIF(LTRIM(RTRIM(Order_Item_Quantity)), '') AS INT)
                                                               AS Order_Item_Quantity,
    CAST(NULLIF(LTRIM(RTRIM(Order_Item_Total)), '') AS DECIMAL(18,2))
                                                               AS Order_Item_Total
FROM Bronze.Orders;
GO



SELECT COUNT(*) AS SilverOrdersCount FROM Silver.Orders;

SELECT Market, COUNT(*) FROM Silver.Orders GROUP BY Market ORDER BY Market;
SELECT Shipping_Mode, COUNT(*) FROM Silver.Orders GROUP BY Shipping_Mode ORDER BY Shipping_Mode;
SELECT Delivery_Status, COUNT(*) FROM Silver.Orders GROUP BY Delivery_Status ORDER BY Delivery_Status;
SELECT Order_Status, COUNT(*) FROM Silver.Orders GROUP BY Order_Status ORDER BY Order_Status;
SELECT Type, COUNT(*) FROM Silver.Orders GROUP BY Type ORDER BY Type;
SELECT Order_Region, COUNT(*) FROM Silver.Orders GROUP BY Order_Region ORDER BY Order_Region;