Create database sales_discount;
use sales_discount;
select * from orders_table

# find out total sales in the table
SELECT SUM(sale_price) AS total_sales 
FROM orders_table;

#find total number of orders in the table
SELECT COUNT(order_id) AS total_orders 
FROM orders_table;

#find highest sale price in the table
SELECT MAX(sale_price) AS highest_sale  
FROM orders_table;

#--find top 10 highest reveue generating products 
SELECT product_id, 
round(SUM(sale_price),2) AS sales
FROM orders_table
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;

#Find average discount given for each category
SELECT category, AVG(discount) AS avg_discount
FROM orders_table
GROUP BY category;

#Find average discount given for each sub category
SELECT sub_category, 
round(AVG(discount),2) AS avg_discount
FROM orders_table
GROUP BY sub_category;

#--find top 5 highest selling products in each region
SELECT region, 
product_id, 
total_sales
FROM (
SELECT region,
product_id,
ROUND(SUM(sale_price), 2) AS total_sales,
ROW_NUMBER() OVER (PARTITION BY region ORDER BY SUM(sale_price) DESC) AS rank_in_region
FROM orders_table
GROUP BY region, product_id)ranked
WHERE rank_in_region <= 5
ORDER BY region, total_sales DESC;
 
#--find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH monthly_sales AS (
SELECT YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sale_price) AS total_sales
FROM orders_table
GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT m.order_month,
sum(CASE WHEN m.order_year = 2022 THEN m.total_sales ELSE 0 END) AS sales_2022,
SUM(CASE WHEN m.order_year = 2023 THEN m.total_sales ELSE 0 END) AS sales_2023,
ROUND(
	(SUM(CASE WHEN m.order_year = 2023 THEN m.total_sales ELSE 0 END) -
	SUM(CASE WHEN m.order_year = 2022 THEN m.total_sales ELSE 0 END)) /
	NULLIF(SUM(CASE WHEN m.order_year = 2022 THEN m.total_sales ELSE 0 END), 0) * 100, 2
    ) AS growth_percentage
FROM monthly_sales m
GROUP BY m.order_month
ORDER BY m.order_month;


#--for each category which month had highest sales 
WITH monthly_sales AS (
SELECT category,
YEAR(order_date) AS order_year,
MONTH(order_date) AS order_month,
SUM(sale_price) AS total_sales
FROM orders_table
GROUP BY category,
YEAR(order_date), MONTH(order_date)
)
SELECT 
    ms.category,
    ms.order_year,
    ms.order_month,
    ms.total_sales
FROM monthly_sales ms
JOIN (SELECT category,
order_year,
MAX(total_sales) AS max_sales
FROM monthly_sales
GROUP BY category, order_year
)
top_sales ON ms.category = top_sales.category
AND ms.order_year = top_sales.order_year
AND ms.total_sales = top_sales.max_sales
ORDER BY ms.category, ms.order_year;


#--which sub category had highest growth by profit in 2023 compare to 2022
SELECT 
    t2023.sub_category,
    t2022.total_profit AS profit_2022,
    t2023.total_profit AS profit_2023,
    ((t2023.total_profit - t2022.total_profit) / t2022.total_profit) * 100 AS profit_growth_percent
FROM 
(SELECT sub_category, SUM(profit) AS total_profit
FROM orders_table
WHERE YEAR(order_date) = 2023
GROUP BY sub_category) AS t2023
JOIN 
    (SELECT sub_category, SUM(profit) AS total_profit
     FROM orders_table
     WHERE YEAR(order_date) = 2022
     GROUP BY sub_category) AS t2022
ON t2023.sub_category = t2022.sub_category
ORDER BY profit_growth_percent DESC
LIMIT 1;
