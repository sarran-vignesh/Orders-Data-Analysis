# Orders-Data-Analysis
## Project Overview



**Project Title**: Orders-Data-Analysis   
**Database**: `sales_discount`

This project focuses on analyzing sales performance, discounts, and order trends using real-world order data.
It combines **Python (Jupyter Notebook), SQL, and CSV datasets** to explore business insights such as:

                 1.Monthly and yearly sales trends
                 2.Category and sub-category performance
                 3.Profit and discount impact on revenue
                 4.Identification of top-performing products and regions


The main goal of this project is to **analyze sales and order data to gain insights that support better business decisions. It focuses on understanding how sales, profit, and discounts interact across different products, customers, and regions.**

## Objectives:

                1.Examine sales and profit trends over time.
                2.Assess the effect of discounts on profitability.
                3.Identify top-performing categories and sub-categories.
                4.Analyze customer segments and regional sales performance.
                5.Use Python and SQL to generate actionable business insights.

## Project Structure:
                1. orders.csv - Raw dataset containing order details (sales, profit, discount, category, region, etc.)

                2. sales discounts.ipynb - Jupyter Notebook for data cleaning, analysis, and visualization using Python.

                3. Orders Data Analysis.sql - SQL script for performing data extraction, aggregation, and trend analysis.


The analysis involved two main phases: 
## Data Preparation using Python and Data Analysis using SQL:

**1. Data Preparation (Python - sales_discounts.ipynb)** - 
The Python script used the pandas library to clean and transform the raw data before loading it into the database.




**Data Cleaning and Standardization:** The raw orders.csv was loaded, and standard null values (Not Available, unknown) were handled. All column names were standardized to lowercase with underscores.



**Feature Engineering:** Three new, crucial financial columns were derived: ***Discount, sale_price, and profit.***



**Database Insertion:** The cleaned and prepared data, totaling 9,994 rows, was successfully inserted into a MySQL table named orders_table.



**2. Analytical Findings (SQL - Orders Data Analysis.sql)**  -

The SQL queries were designed to extract key business insights across sales, growth, and product performance.



**Overall Performance:** Queries were set up to find the total sales, total number of orders, and the highest single sale price in the dataset.



**Product & Regional Analysis:** Identified the top 10 highest revenue-generating products overall and the top 5 highest-selling products within each sales region (using ROW_NUMBER() for ranking).



**Discount Strategy:** Calculated the average discount applied to each major category and each sub_category, providing a granular view of discounting practices.



**Growth & Trend Analysis:** Calculated the month-over-month sales growth percentage for 2023 compared to 2022, and identified the specific month with the highest sales for each category across both years.



**Profit Drivers:** Identified the single sub-category that had the highest profit growth percentage in 2023 compared to 2022, pinpointing the most successful product line.



## Conclusion

The project successfully executed a full data pipeline, from **cleaning and feature engineering** in Python (9,994 records processed) to detailed **analytical reporting** in MySQL. The key conclusion is that the business has a **clear, data-driven foundation for strategy, with identified areas of success, including a **top-performing sub-category** driving significant profit growth, and a framework for optimizing discount strategies and addressing seasonal trends based on the **Year-over-Year growth analysis**.**


The analysis helps in:

                    1. Identifying profitable areas and improvement opportunities.
                    2. Making data-driven decisions on pricing and discount strategies.
                    3. Supporting better forecasting and business planning.

This project is part of my portfolio, showcasing the PYTHON,SQL AND analyzing skills essential for data analyst roles.

- **LinkedIn**(www.linkedin.com/in/sarranvicky8)
