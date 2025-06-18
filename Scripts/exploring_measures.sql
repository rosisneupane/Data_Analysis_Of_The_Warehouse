/*
===============================================================================
Key Metrics Overview
===============================================================================
Summary:
    Quickly calculate business performance indicators from fact and dimension data.
===============================================================================
*/

-- Total revenue generated
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- Total items sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales;

-- Average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

-- Total number of orders (including duplicates)
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;

-- Total number of unique orders
SELECT COUNT(DISTINCT order_number) AS total_unique_orders FROM gold.fact_sales;

-- Total number of products available
SELECT COUNT(product_name) AS total_products FROM gold.dim_products;

-- Total number of registered customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers;

-- Number of customers who made a purchase
SELECT COUNT(DISTINCT customer_key) AS active_customers FROM gold.fact_sales;

-- Combined summary of all key business metrics
SELECT 'Total Sales' AS metric, SUM(sales_amount) AS value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Unique Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
