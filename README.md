# Superstore-Sales-Analysis-SQL-Excel-Project

# Superstore Sales Analysis – SQL + Excel Dashboard

## Project Overview
This project showcases **end-to-end data analysis** using:
- **SQL Server** for data storage, cleaning, and KPI calculation
- **Excel** for visual dashboards and storytelling

I started with the raw **Superstore dataset**, cleaned and split it into **3 tables** (`Customers`, `Products`, `Orders`) in SQL Server, wrote KPI queries, and finally built a professional **Excel dashboard**.

The aim is to demonstrate how SQL can be used to prepare analysis-ready data, and how Excel can turn that data into **clear business insights**.

---

##  Dataset
- Source: [Superstore Sample Dataset](https://www.kaggle.com/datasets)  
- Records: ~10,000 orders across 4 regions of the US  
- Key Columns: `OrderID`, `CustomerID`, `OrderDate`, `ShipMode`, `Sales`, `Profit`, `Region`, `Category`, etc.

---

##  Workflow
1. **Data Import & Cleaning in SQL**
   - Removed duplicates, fixed data-types
   - Normalized into 4 tables: `Customers`, `Products`, `Orders`, 'OrderDetails'
   - Added Primary & Foreign Keys

2. **Schema design**
   - **Customers** – CustomerID, CustomerName, Segment, Country, Region, City, State
   - **Products** – ProductID, ProductName, Category, SubCategory
   - **Orders** – OrderID, OrderDate, ShipDate, ShipMode, CustomerID
   - **OrderDetails** - OrderID, ProductID, Quantity, Discount, Sales, Profit


3. **Analysis in SQL**
   - Wrote KPI queries for:
     - Total Sales, Total Profit, Profit Margin
     - Sales/Profit by Region, Category
     - Top 10 Products and Customers
     - Orders by Ship Mode
     -  for monthly trend & repeat customers etc.

4. **Visualization in Excel**
   - Imported SQL query results into Excel
   - Designed a clean dashboard layout

---

##  Dashboard Preview
<img width="1437" height="690" alt="Dashboard" src="https://github.com/user-attachments/assets/49d305c5-8a21-453c-9b32-a60b70592709" />


---

##  Key Insights
- **Total Sales:** ₹ 22,95,534  
- **Total Profit:** ₹ 2,86,444  
- **Profit Margin:** **12.47 %**

**Highlights:**
- The **West Region** dominates revenue (≈ ₹ 21 L)  
- **Technology** category earns the highest profit (~₹ 1.53 L)  
- **Top-selling product:** Avery 484  
- **Top customer:** Sean Miller (₹ 25,043)  
- **Standard Class shipping** handles ~60 % of orders  
- South and East show opportunities for growth compared to West  

## Files in this repo
- SQL raw data cleaning script
- SQL schema designing script (table creation)
- SQL query scripts for KPI requirements
- Superstore raw data file

