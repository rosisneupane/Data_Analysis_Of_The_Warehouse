# 📊 SQL Data Analytics Project: Retail Sales & Customer Insights

This project builds a comprehensive **data warehouse and reporting suite** using SQL Server, focused on analyzing retail sales, customer behavior, and product performance. It follows a structured, modular approach from data ingestion to advanced analytical reporting.

---

## 🚀 Project Objectives

- Design and populate a scalable **Data Warehouse** using the Medallion Architecture (Gold Layer).
- Perform detailed **exploratory data analysis** using SQL.
- Build **aggregated reports and dashboards** using SQL views for business insights.
- Segment **customers and products** to identify high-performers, low-engagement entities, and trends over time.

---

---


---

## 📦 Data Sources

- `dim_customers`: Customer demographic and registration data.
- `dim_products`: Product catalog with categories and cost details.
- `fact_sales`: Historical transaction data (orders, quantity, sales amount).

---

## 📈 Key Analytical Modules

### 🔹 Initialization
- `init_database.sql`: Creates the database, schemas, and loads data from CSVs into the `gold` layer.

### 🔹 Exploratory Scripts
- `database_exploration.sql`: Lists all tables and columns using `INFORMATION_SCHEMA`.
- `exploration_of_dimension.sql`: Checks distinct values in country, category, subcategory.
- `exploring_dates.sql`: Analyzes date ranges, order periods, and customer ages.
- `exploring_measures.sql`: Calculates totals and averages for sales, quantity, and orders.

### 🔹 Analytical Modules
- `1.magnitude_analysis.sql`: Groups data by country, gender, category for volume insights.
- `2.Ranking_Analysis.sql`: Ranks top/bottom products and customers by revenue and orders.
- `3.Analysing_Change_Over_Time.sql`: Tracks sales trends monthly using time functions.
- `4 performance_analysis.sql`: Measures year-over-year and average benchmarks using `LAG()` and `AVG() OVER`.
- `Data_Segmentation.sql`: Segments customers and products by behavior, value, and cost.

### 🔹 Reporting Views
- `5.Customer_Reporting.sql`: Creates `gold.report_customers` with customer KPIs, segmentation, and recency.
- `6.product_report.sql`: Creates `gold.report_products` with product KPIs, performance tiers, and monthly revenue.

---

## 🛠️ Technologies Used

- **SQL Server 2019+**
- **T-SQL / Window Functions**
- **Views, CTEs, Aggregates, Conditional Logic**
- Input Data: `.csv` files using `BULK INSERT`

---

## ▶️ How to Run

1. Make sure SQL Server is up and running.
2. Start by executing `init_database.sql` to create the database and load your data.
3. Run the exploration and analysis scripts in any order to explore and generate insights.
4. Use the views `gold.report_customers` and `gold.report_products` for final reporting.

---

## 📌 Notes

- File paths in `BULK INSERT` may need to be adjusted to match your local setup.
- This project assumes clean and pre-validated CSVs. No preprocessing is included.
- Views are read-optimized for dashboard consumption or export.

---

## 📤 Future Enhancements

- Power BI integration for interactive dashboards.


---

