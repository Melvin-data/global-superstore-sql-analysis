-- Preview Dataset
SELECT TOP 10 *
FROM dbo.[global_superstore_raw.csv];


-- Total Sales
SELECT 
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.[global_superstore_raw.csv];



-- Total Profit
SELECT 
ROUND(SUM(Profit),2) AS Total_Profit
FROM dbo.[global_superstore_raw.csv];


-- Total Orders
SELECT 
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM dbo.[global_superstore_raw.csv];



-- Sales by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.[global_superstore_raw.csv]
GROUP BY Category
ORDER BY Total_Sales DESC;



-- Sales by Region
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.[global_superstore_raw.csv]
GROUP BY Region
ORDER BY Total_Sales DESC;



-- Top Customers
SELECT TOP 10
Customer_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.[global_superstore_raw.csv]
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;



-- Least Profitable Products
SELECT TOP 10
Product_Name,
ROUND(SUM(TRY_CONVERT(float, Profit)),2) AS Total_Profit
FROM dbo.[global_superstore_raw.csv]
WHERE TRY_CONVERT(float, Profit) IS NOT NULL
GROUP BY Product_Name
HAVING SUM(TRY_CONVERT(float, Profit)) < 0
ORDER BY Total_Profit ASC;



-- Sales by Market
SELECT
Market,
ROUND(SUM(Sales),2) AS Total_Sales
FROM dbo.[global_superstore_raw.csv]
GROUP BY Market
ORDER BY Total_Sales DESC;