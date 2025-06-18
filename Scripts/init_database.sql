/*
=============================================================
Initialize Data Warehouse Environment
=============================================================

Script Overview:
    This script sets up a new SQL Server database named 'DataWarehouseAnalytics'.
    If the database already exists, it will be forcefully dropped and recreated.
    A schema named 'gold' is also created to hold cleaned and transformed data
    (following the Medallion Architecture).

 WARNING:
    Executing this script will permanently delete the existing 'DataWarehouseAnalytics' database,
    including all data it contains. Ensure you have backups or are working in a safe environment
    before running this script.

*/

USE master;
GO

-- Check if 'DataWarehouseAnalytics' exists and delete it if present
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create a fresh instance of the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;
GO

-- Switch context to the newly created database
USE DataWarehouseAnalytics;
GO

-- Create schema for curated (Gold layer) data
CREATE SCHEMA gold;
GO

-- Create Customer Dimension Table
CREATE TABLE gold.dim_customers (
    customer_key      INT,
    customer_id       INT,
    customer_number   NVARCHAR(50),
    first_name        NVARCHAR(50),
    last_name         NVARCHAR(50),
    country           NVARCHAR(50),
    marital_status    NVARCHAR(50),
    gender            NVARCHAR(50),
    birthdate         DATE,
    create_date       DATE
);
GO

-- Create Product Dimension Table
CREATE TABLE gold.dim_products (
    product_key       INT,
    product_id        INT,
    product_number    NVARCHAR(50),
    product_name      NVARCHAR(50),
    category_id       NVARCHAR(50),
    category          NVARCHAR(50),
    subcategory       NVARCHAR(50),
    maintenance       NVARCHAR(50),
    cost              INT,
    product_line      NVARCHAR(50),
    start_date        DATE
);
GO

-- Create Sales Fact Table
CREATE TABLE gold.fact_sales (
    order_number      NVARCHAR(50),
    product_key       INT,
    customer_key      INT,
    order_date        DATE,
    shipping_date     DATE,
    due_date          DATE,
    sales_amount      INT,
    quantity          TINYINT,
    price             INT
);
GO

-- Load Customer Dimension Data
TRUNCATE TABLE gold.dim_customers;
GO

BULK INSERT gold.dim_customers
FROM 'C:\sql-data-analytics-project\datasets\csv-files\gold.dim_customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

-- Load Product Dimension Data
TRUNCATE TABLE gold.dim_products;
GO

BULK INSERT gold.dim_products
FROM 'C:\sql-data-analytics-project\datasets\csv-files\gold.dim_products.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO

-- Load Sales Fact Data
TRUNCATE TABLE gold.fact_sales;
GO

BULK INSERT gold.fact_sales
FROM 'C:\sql-data-analytics-project\datasets\csv-files\gold.fact_sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO
