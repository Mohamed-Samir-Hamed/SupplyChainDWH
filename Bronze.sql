USE SupplyChainDWH
GO

CREATE SCHEMA Bronze
GO

------ Row counts ------

SELECT COUNT(*) AS Customers_Rows FROM Bronze.Customers;
SELECT COUNT(*) AS Products_Rows  FROM Bronze.Products;
SELECT COUNT(*) AS Orders_Rows    FROM Bronze.Orders;
SELECT COUNT(*) AS Salesman_Rows  FROM Bronze.Salesman;

------ Customers Nulls ------

SELECT
   'Bronze.Customers' AS TableName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Customer_Id           IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Id,
    SUM(CASE WHEN Customer_Fname        IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Fname,
    SUM(CASE WHEN Customer_Lname        IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Lname,
    SUM(CASE WHEN Customer_Email        IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Email,
    SUM(CASE WHEN Customer_Password     IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Password,
    SUM(CASE WHEN Customer_Segment      IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Segment,
    SUM(CASE WHEN Customer_City         IS NULL THEN 1 ELSE 0 END) AS Null_Customer_City,
    SUM(CASE WHEN Customer_State        IS NULL THEN 1 ELSE 0 END) AS Null_Customer_State,
    SUM(CASE WHEN Customer_Street       IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Street,
    SUM(CASE WHEN Customer_Zipcode      IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Zipcode,
    SUM(CASE WHEN Customer_Country      IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Country,
    SUM(CASE WHEN Latitude              IS NULL THEN 1 ELSE 0 END) AS Null_Latitude,
    SUM(CASE WHEN Longitude             IS NULL THEN 1 ELSE 0 END) AS Null_Longitude,
    SUM(CASE WHEN Customer_Birth_Date   IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Birth_Date
FROM Bronze.Customers;

------ Orders Nulls ------

SELECT
    'Bronze.Orders' AS TableName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Order_Id                    IS NULL THEN 1 ELSE 0 END) AS Null_Order_Id,
    SUM(CASE WHEN Order_Item_Id               IS NULL THEN 1 ELSE 0 END) AS Null_Order_Item_Id,
    SUM(CASE WHEN Customer_Id                 IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Id,
    SUM(CASE WHEN Product_Card_Id             IS NULL THEN 1 ELSE 0 END) AS Null_Product_Card_Id,
    SUM(CASE WHEN Type                        IS NULL THEN 1 ELSE 0 END) AS Null_Type,
    SUM(CASE WHEN Days_for_shipping_real      IS NULL THEN 1 ELSE 0 END) AS Null_Days_for_shipping_real,
    SUM(CASE WHEN Days_for_shipment_scheduled IS NULL THEN 1 ELSE 0 END) AS Null_Days_for_shipment_scheduled,
    SUM(CASE WHEN Benefit_per_order           IS NULL THEN 1 ELSE 0 END) AS Null_Benefit_per_order,
    SUM(CASE WHEN Delivery_Status             IS NULL THEN 1 ELSE 0 END) AS Null_Delivery_Status,
    SUM(CASE WHEN Late_delivery_risk          IS NULL THEN 1 ELSE 0 END) AS Null_Late_delivery_risk,
    SUM(CASE WHEN Market                      IS NULL THEN 1 ELSE 0 END) AS Null_Market,
    SUM(CASE WHEN Order_Region                IS NULL THEN 1 ELSE 0 END) AS Null_Order_Region,
    SUM(CASE WHEN Order_State                 IS NULL THEN 1 ELSE 0 END) AS Null_Order_State,
    SUM(CASE WHEN Order_Status                IS NULL THEN 1 ELSE 0 END) AS Null_Order_Status,
    SUM(CASE WHEN Order_Zipcode               IS NULL THEN 1 ELSE 0 END) AS Null_Order_Zipcode,
    SUM(CASE WHEN order_date_DateOrders       IS NULL THEN 1 ELSE 0 END) AS Null_order_date,
    SUM(CASE WHEN shipping_date_DateOrders    IS NULL THEN 1 ELSE 0 END) AS Null_shipping_date,
    SUM(CASE WHEN Shipping_Mode               IS NULL THEN 1 ELSE 0 END) AS Null_Shipping_Mode,
    SUM(CASE WHEN Order_Item_Discount         IS NULL THEN 1 ELSE 0 END) AS Null_Order_Item_Discount,
    SUM(CASE WHEN Order_Item_Profit_Ratio     IS NULL THEN 1 ELSE 0 END) AS Null_Order_Item_Profit_Ratio,
    SUM(CASE WHEN Order_Item_Quantity         IS NULL THEN 1 ELSE 0 END) AS Null_Order_Item_Quantity,
    SUM(CASE WHEN Order_Item_Total            IS NULL THEN 1 ELSE 0 END) AS Null_Order_Item_Total,
    SUM(CASE WHEN salesman_id                 IS NULL THEN 1 ELSE 0 END) AS Null_salesman_id
FROM Bronze.Orders;

------ Products Nulls ------

SELECT
    'Bronze.Products' AS TableName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Product_Card_Id     IS NULL THEN 1 ELSE 0 END) AS Null_Product_Card_Id,
    SUM(CASE WHEN Product_Name        IS NULL THEN 1 ELSE 0 END) AS Null_Product_Name,
    SUM(CASE WHEN Product_Price       IS NULL THEN 1 ELSE 0 END) AS Null_Product_Price,
    SUM(CASE WHEN Product_Status      IS NULL THEN 1 ELSE 0 END) AS Null_Product_Status,
    SUM(CASE WHEN Product_Description IS NULL THEN 1 ELSE 0 END) AS Null_Product_Description,
    SUM(CASE WHEN Category_Id         IS NULL THEN 1 ELSE 0 END) AS Null_Category_Id,
    SUM(CASE WHEN Category_Name       IS NULL THEN 1 ELSE 0 END) AS Null_Category_Name,
    SUM(CASE WHEN Department_Id       IS NULL THEN 1 ELSE 0 END) AS Null_Department_Id,
    SUM(CASE WHEN Department_Name     IS NULL THEN 1 ELSE 0 END) AS Null_Department_Name
FROM Bronze.Products;

------ Salesman Nulls ------

SELECT
    'Bronze.Salesman' AS TableName,
    COUNT(*) AS TotalRows,
    SUM(CASE WHEN Salesman_Id      IS NULL THEN 1 ELSE 0 END) AS Null_Salesman_Id,
    SUM(CASE WHEN Salesman_Fname   IS NULL THEN 1 ELSE 0 END) AS Null_Salesman_Fname,
    SUM(CASE WHEN Salesman_Lname   IS NULL THEN 1 ELSE 0 END) AS Null_Salesman_Lname,
    SUM(CASE WHEN Salesman_Email   IS NULL THEN 1 ELSE 0 END) AS Null_Salesman_Email,
    SUM(CASE WHEN Market           IS NULL THEN 1 ELSE 0 END) AS Null_Market,
    SUM(CASE WHEN Region           IS NULL THEN 1 ELSE 0 END) AS Null_Region,
    SUM(CASE WHEN Hire_Date        IS NULL THEN 1 ELSE 0 END) AS Null_Hire_Date,
    SUM(CASE WHEN Commission_Rate  IS NULL THEN 1 ELSE 0 END) AS Null_Commission_Rate
FROM Bronze.Salesman;

------ Customers Blank Values ------

SELECT
    SUM(CASE WHEN Customer_Id IS NOT NULL AND LTRIM(RTRIM(Customer_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Id,
    SUM(CASE WHEN Customer_Email IS NOT NULL AND LTRIM(RTRIM(Customer_Email)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Email,
    SUM(CASE WHEN Customer_Segment IS NOT NULL AND LTRIM(RTRIM(Customer_Segment)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Segment,
    SUM(CASE WHEN Customer_Country IS NOT NULL AND LTRIM(RTRIM(Customer_Country)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Country
FROM Bronze.Customers;

SELECT
    COUNT(*) AS BlankOrWhitespaceCount
FROM Bronze.Customers
WHERE Customer_City IS NOT NULL
  AND LTRIM(RTRIM(Customer_City)) = '';

  ------ Products Blank Values ------

  SELECT
    SUM(CASE WHEN Product_Card_Id IS NOT NULL AND LTRIM(RTRIM(Product_Card_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Product_Card_Id,
    SUM(CASE WHEN Product_Name IS NOT NULL AND LTRIM(RTRIM(Product_Name)) = '' THEN 1 ELSE 0 END) AS Blank_Product_Name,
    SUM(CASE WHEN Category_Id IS NOT NULL AND LTRIM(RTRIM(Category_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Category_Id,
    SUM(CASE WHEN Department_Id IS NOT NULL AND LTRIM(RTRIM(Department_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Department_Id
FROM Bronze.Products;

  ------ Salesman Blank Values ------

  SELECT
    SUM(CASE WHEN Salesman_Id IS NOT NULL AND LTRIM(RTRIM(Salesman_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Salesman_Id,
    SUM(CASE WHEN Salesman_Email IS NOT NULL AND LTRIM(RTRIM(Salesman_Email)) = '' THEN 1 ELSE 0 END) AS Blank_Salesman_Email,
    SUM(CASE WHEN Market IS NOT NULL AND LTRIM(RTRIM(Market)) = '' THEN 1 ELSE 0 END) AS Blank_Market,
    SUM(CASE WHEN Region IS NOT NULL AND LTRIM(RTRIM(Region)) = '' THEN 1 ELSE 0 END) AS Blank_Region
FROM Bronze.Salesman;

  ------ Orders Blank Values ------

  SELECT
    SUM(CASE WHEN Order_Id IS NOT NULL AND LTRIM(RTRIM(Order_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Order_Id,
    SUM(CASE WHEN Order_Item_Id IS NOT NULL AND LTRIM(RTRIM(Order_Item_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Order_Item_Id,
    SUM(CASE WHEN Customer_Id IS NOT NULL AND LTRIM(RTRIM(Customer_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Customer_Id,
    SUM(CASE WHEN Product_Card_Id IS NOT NULL AND LTRIM(RTRIM(Product_Card_Id)) = '' THEN 1 ELSE 0 END) AS Blank_Product_Card_Id,
    SUM(CASE WHEN salesman_id IS NOT NULL AND LTRIM(RTRIM(salesman_id)) = '' THEN 1 ELSE 0 END) AS Blank_salesman_id
FROM Bronze.Orders;

------  Invalid data types ------

--- IDs ---

SELECT *
FROM Bronze.Products
WHERE Product_Card_Id IS NOT NULL
  AND TRY_CAST(Product_Card_Id AS BIGINT) IS NULL;

SELECT *
FROM Bronze.Salesman
WHERE Salesman_Id IS NOT NULL
  AND TRY_CAST(Salesman_Id AS BIGINT) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Order_Id IS NOT NULL
  AND TRY_CAST(Order_Id AS BIGINT) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Order_Item_Id IS NOT NULL
  AND TRY_CAST(Order_Item_Id AS BIGINT) IS NULL;

 --- Dates ---

 SELECT *
FROM Bronze.Customers
WHERE Customer_Birth_Date IS NOT NULL
  AND TRY_CONVERT(DATE, Customer_Birth_Date, 120) IS NULL;

SELECT *
FROM Bronze.Salesman
WHERE Hire_Date IS NOT NULL
  AND TRY_CONVERT(DATE, Hire_Date, 120) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE order_date_DateOrders IS NOT NULL
  AND TRY_CONVERT(DATE, order_date_DateOrders, 120) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE shipping_date_DateOrders IS NOT NULL
  AND TRY_CONVERT(DATE, shipping_date_DateOrders, 120) IS NULL;

   --- Numeric measures ---

-- Product Price --

SELECT *
FROM Bronze.Products
WHERE Product_Price IS NOT NULL
  AND TRY_CAST(Product_Price AS DECIMAL(18,4)) IS NULL;

-- Commission Rate -- 

SELECT *
FROM Bronze.Salesman
WHERE Commission_Rate IS NOT NULL
  AND TRY_CAST(Commission_Rate AS DECIMAL(18,4)) IS NULL;

-- Order measures --

SELECT *
FROM Bronze.Orders
WHERE Benefit_per_order IS NOT NULL
  AND TRY_CAST(Benefit_per_order AS DECIMAL(18,4)) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Order_Item_Quantity IS NOT NULL
  AND TRY_CAST(Order_Item_Quantity AS DECIMAL(18,4)) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Order_Item_Total IS NOT NULL
  AND TRY_CAST(Order_Item_Total AS DECIMAL(18,4)) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Days_for_shipping_real IS NOT NULL
  AND TRY_CAST(Days_for_shipping_real AS DECIMAL(18,4)) IS NULL;

SELECT *
FROM Bronze.Orders
WHERE Days_for_shipment_scheduled IS NOT NULL
  AND TRY_CAST(Days_for_shipment_scheduled AS DECIMAL(18,4)) IS NULL;

------ Distinct Market values in Orders and Salesman ------

SELECT DISTINCT LTRIM(RTRIM(Market)) AS Market_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Market))
ORDER BY Market_Cleaned;

SELECT DISTINCT LTRIM(RTRIM(Market)) AS Market_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Salesman
GROUP BY LTRIM(RTRIM(Market))
ORDER BY Market_Cleaned;

------ Distinct Order Region and Salesman Region ------

SELECT DISTINCT LTRIM(RTRIM(Order_Region)) AS Order_Region_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Order_Region))
ORDER BY Order_Region_Cleaned;

SELECT DISTINCT LTRIM(RTRIM(Region)) AS Salesman_Region_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Salesman
GROUP BY LTRIM(RTRIM(Region))
ORDER BY Salesman_Region_Cleaned;

------ Distinct Shipping Mode ------

SELECT DISTINCT LTRIM(RTRIM(Shipping_Mode)) AS Shipping_Mode_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Shipping_Mode))
ORDER BY Shipping_Mode_Cleaned;

------ Delivery Status ------

SELECT DISTINCT LTRIM(RTRIM(Delivery_Status)) AS Delivery_Status_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Delivery_Status))
ORDER BY Delivery_Status_Cleaned;

------ Order Status ------

SELECT DISTINCT LTRIM(RTRIM(Order_Status)) AS Order_Status_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Order_Status))
ORDER BY Order_Status_Cleaned;

------ Order Type ------

SELECT DISTINCT LTRIM(RTRIM(Type)) AS Type_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Orders
GROUP BY LTRIM(RTRIM(Type))
ORDER BY Type_Cleaned;

------ Customer Segment ------

SELECT DISTINCT LTRIM(RTRIM(Customer_Segment)) AS Customer_Segment_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Customers
GROUP BY LTRIM(RTRIM(Customer_Segment))
ORDER BY Customer_Segment_Cleaned;

------ Product Status ------

SELECT DISTINCT LTRIM(RTRIM(Product_Status)) AS Product_Status_Cleaned,
       COUNT(*) AS Count
FROM Bronze.Products
GROUP BY LTRIM(RTRIM(Product_Status))
ORDER BY Product_Status_Cleaned;

------ Customers Duplicates ------

SELECT
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
    Customer_Birth_Date,
    COUNT(*) AS DuplicateCount
FROM Bronze.Customers
GROUP BY
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
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

------ Products Duplicates ------

SELECT
    Product_Card_Id,
    Product_Name,
    Product_Price,
    Product_Status,
    Product_Description,
    Category_Id,
    Category_Name,
    Department_Id,
    Department_Name,
    COUNT(*) AS DuplicateCount
FROM Bronze.Products
GROUP BY
    Product_Card_Id,
    Product_Name,
    Product_Price,
    Product_Status,
    Product_Description,
    Category_Id,
    Category_Name,
    Department_Id,
    Department_Name
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

------ Salesman Duplicates ------

SELECT
    Salesman_Id,
    Salesman_Fname,
    Salesman_Lname,
    Salesman_Email,
    Market,
    Region,
    Hire_Date,
    Commission_Rate,
    COUNT(*) AS DuplicateCount
FROM Bronze.Salesman
GROUP BY
    Salesman_Id,
    Salesman_Fname,
    Salesman_Lname,
    Salesman_Email,
    Market,
    Region,
    Hire_Date,
    Commission_Rate
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

------ Orders Duplicates ------

SELECT
    Order_Id,
    Order_Item_Id,
    Customer_Id,
    Product_Card_Id,
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
    order_date_DateOrders,
    shipping_date_DateOrders,
    Shipping_Mode,
    Order_Item_Discount,
    Order_Item_Profit_Ratio,
    Order_Item_Quantity,
    Order_Item_Total,
    salesman_id,
    COUNT(*) AS DuplicateCount
FROM Bronze.Orders
GROUP BY
    Order_Id,
    Order_Item_Id,
    Customer_Id,
    Product_Card_Id,
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
    order_date_DateOrders,
    shipping_date_DateOrders,
    Shipping_Mode,
    Order_Item_Discount,
    Order_Item_Profit_Ratio,
    Order_Item_Quantity,
    Order_Item_Total,
    salesman_id
HAVING COUNT(*) > 1
ORDER BY DuplicateCount DESC;

