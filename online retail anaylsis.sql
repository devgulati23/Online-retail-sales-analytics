USE ecommerce_analysis;
SELECT COUNT(*) as total_rows
FROM online_retail;
SELECT * FROM online_retail LIMIT 10;
DESCRIBE online_retail;
-- ==========================================
-- KPI ANALYSIS
-- ==========================================
SELECT
	ROUND(SUM(Revenue),2) AS Total_Revenue
FROM online_retail;
SELECT
	COUNT(DISTINCT customer_id) AS Total_Customers
FROM online_retail;
SELECT
	ROUND(AVG(Revenue),2) AS Avereage_Order_Value
FROM online_retail;
SELECT
	ROUND(AVG(age),2) AS Average_Customer_Age
from online_retail;
-- Business Question 1:
-- Which products/ categories have the maximum revenue?
SELECT
    category_name,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY category_name
ORDER BY total_revenue DESC;
-- Business Qustion 2:
-- Which city has the maximum customers?
SELECT 
	city, COUNT(DISTINCT customer_id) AS total_customers 
from online_retail
GROUP BY city
ORDER BY total_customers DESC;
-- Business Question 3:
-- Which month/ quarter/year contribute to maximum revenue?
SELECT
    `Order Month`,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY `Order Month`
ORDER BY total_revenue DESC;
SELECT
    `Order Quarter`,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY `Order Quarter`
ORDER BY total_revenue DESC;
SELECT
    `Order Year`,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY `Order Year`
ORDER BY total_revenue DESC;
-- Business Question 4:
-- What is the average order value?
SELECT 
	ROUND(AVG(revenue),2) AS average_order_value
FROM online_retail;
-- Business Question 5:
-- What is the monthly sales trend?
SELECT
    `Order Month`,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM online_retail
GROUP BY `Order Month`
ORDER BY STR_TO_DATE(`Order Month`, '%M');
-- Business Question 6:
-- Which age group spends the most?
SELECT
	`Age Group`,
    ROUND(SUM(REVENUE),2) AS total_revenue
FROM online_retail
GROUP BY `Age Group`
ORDER BY total_revenue DESC;
-- Business Question 7:
-- Which gender places most orders?
SELECT
	gender,
     COUNT(*)  AS total_orders
FROM online_retail
GROUP BY gender
ORDER BY total_orders DESC;
-- Business Question 8:
-- Which payment method is used the most?
SELECT
	payment_method,
    COUNT(*) AS total_orders
FROM online_retail
GROUP BY payment_method
ORDER BY total_orders;
-- Business Question 9:
-- What is the average review score?
SELECT 
	ROUND(AVG(review_score),2) AS average_order_score
from online_retail;
-- Business Question 10:
-- Which product has the highest review score?
SELECT
	product_name, 
	ROUND(AVG(review_score),2) AS average_order_score
FROM online_retail
WHERE review_score IS NOT NULL
GROUP BY product_name
ORDER BY average_order_score DESC;
-- Business Quesiton 11:
-- Are sales increasing or decreasing over time?
SELECT
    `Order Month`,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM online_retail
GROUP BY `Order Month`
ORDER BY STR_TO_DATE(`Order Month`, '%M');
-- Business Question 12: 
-- Which months requires promotional campaigns?

SELECT
    `Order Month`,
    ROUND(SUM(Revenue), 2) AS monthly_revenue
FROM online_retail
GROUP BY `Order Month`
ORDER BY monthly_revenue ASC;
-- Business Question 13:
-- Which category has consistent sales over the year?
SELECT
    `category_name`,
    `Order Month`,
    ROUND(SUM(revenue), 2) AS monthly_revenue
FROM online_retail
GROUP BY `category_name`, `Order Month`
ORDER BY `category_name`, STR_TO_DATE(`Order Month`, '%M');
-- Business Question 14:
-- Which categories/ products performed worst?
SELECT
    category_name,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY category_name
ORDER BY total_revenue ASC
LIMIT 5;
-- Business Question 15:
-- Which cities are contributing low to revenue?SELECT
SELECT    
    city,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM online_retail
GROUP BY city
ORDER BY total_revenue ASC
LIMIT 5;	