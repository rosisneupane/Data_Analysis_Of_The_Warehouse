/*
===============================================================================
Database Exploration Script
===============================================================================
Quickly explores the database structure by listing tables and inspecting columns.

===============================================================================
*/

-- List all tables with their catalog, schema, and type
SELECT 
    TABLE_CATALOG, 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES;

-- Get column details for the 'dim_customers' table
SELECT 
    COLUMN_NAME, 
    DATA_TYPE, 
    IS_NULLABLE, 
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers';
