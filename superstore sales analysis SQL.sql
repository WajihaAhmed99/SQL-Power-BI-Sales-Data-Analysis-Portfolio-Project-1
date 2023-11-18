-- Overall view of superstore sales dataset --
SELECT
COUNT(order_id) AS Total_oreders,
COUNT(DISTINCT country) AS Total_countries,
COUNT(DISTINCT product_name) AS Total_products,
COUNT(DISTINCT category) AS Total_categories,
COUNT(DISTINCT sub_category) AS Total_subcategories,
COUNT(DISTINCT year) AS Total_years,
SUM(sales) AS Total_sales,
SUM(quantity) AS Total_quantity_sold,
AVG(profit) AS Avg_profit,
AVG(discount) AS Total_discount
FROM dbo.SuperStoreOrders

-- sales performance analysis --
SELECT TOP 10
product_name,
category,
SUM(sales) AS Toatl_sales,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY
product_name,
category
ORDER BY 
SUM(sales) DESC
--sales over year --
SELECT 
year,
SUM(sales) AS Total_sales
FROM dbo.SuperStoreOrders
GROUP BY year
ORDER BY SUM(sales) DESC

-- customer segmentation --
SELECT
segment,
COUNT(DISTINCT customer_name) AS Toatl_customers,
SUM(sales) AS Total_sales
FROM dbo.SuperStoreOrders
GROUP BY segment
ORDER BY SUM(sales) DESC

-- Shipping and order management --
SELECT
ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(profit) AS Avg_profit
FROM dbo.SuperStoreOrders
GROUP BY ship_mode
ORDER BY AVG(profit)

--time analysis --
SELECT
ship_mode,
AVG(DATEDIFF(DAY, TRY_CAST(order_date AS DATE), TRY_CAST(ship_date AS DATE))) AS Avg_time_gape
FROM dbo.SuperStoreOrders
GROUP BY ship_mode

-- profibility and cost analysis --
SELECT
product_name,
category,
sub_category,
AVG(profit) AS Avg_profit,
AVG(discount) AS Avg_dicount
FROM dbo.SuperStoreOrders
GROUP BY 
product_name,
category,
sub_category
ORDER BY AVG(profit) DESC

-- Global sales and quantity product overview --
SELECT
country,
SUM(sales) AS Total_sales,
SUM(quantity)  AS Total_quantity
FROM dbo.SuperStoreOrders
GROUP BY country
ORDER BY SUM(sales) DESC


-- state level category exploration --
SELECT 
product_name,
category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY 
product_name,
category
ORDER BY SUM(quantity) DESC

-- Regional subcategory analysis --
SELECT
region,
sub_category,
SUM(quantity) AS Total_quantity_sold
FROM dbo.SuperStoreOrders
GROUP BY region,
sub_category
ORDER BY SUM(quantity) DESC

