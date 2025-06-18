/*
===============================================================================
Explore Dimension Tables
===============================================================================
Overview:
    Retrieve distinct values from key dimension fields for quick structure insight.

SQL Features:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- Get distinct list of customer countries
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Get distinct combinations of product category, subcategory, and name
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
