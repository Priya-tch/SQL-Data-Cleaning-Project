World Layoffs Data Cleaning using SQL

• Project Overview

This project focuses on cleaning and preparing the "World Layoffs Dataset" using "MySQL". The objective was to transform raw data into a clean and consistent dataset suitable for analysis and visualization.

The project demonstrates common SQL data cleaning techniques such as removing duplicates, handling missing values, standardizing text, formatting dates, and deleting unnecessary columns.

---

• Project Structure

World-Layoffs-SQL-Data-Cleaning

* Data_Cleaning.sql
* layoffs.csv
* README.md

---

• Tools Used

- MySQL
- MySQL Workbench
- SQL

---

• Dataset

The dataset contains information about company layoffs around the world, including:

- Company
- Location
- Industry
- Total Employees Laid Off
- Percentage Laid Off
- Date
- Funding Raised
- Company Stage
- Country

---

• Data Cleaning Process

The following data cleaning steps were performed:

1.  Created a Staging Table

- Created a duplicate table to preserve the original dataset.
- Inserted all records into the staging table before cleaning.

---

2.  Removed Duplicate Records

- Used the `ROW_NUMBER()` window function.
- Identified duplicate rows based on multiple columns.
- Deleted duplicate records while keeping one unique record.

---

3.  Standardized Data

Performed several standardization tasks including:

- Removed leading and trailing spaces from company names.
- Standardized industry names.
- Corrected country name formatting.
- Converted the Date column from text to DATE format.

---

4.  Handled Missing Values

- Replaced blank values with NULL.
- Populated missing industry values using self joins where possible.
- Removed rows containing insufficient information.

---

5.  Removed Unnecessary Columns

Dropped temporary columns created during the cleaning process, including:

- `row_num`
- `date_added`

---

• SQL Concepts Used

- CREATE TABLE
- INSERT INTO
- UPDATE
- DELETE
- ALTER TABLE
- ROW_NUMBER()
- Common Table Expressions (CTEs)
- Window Functions
- Self Joins
- TRIM()
- STR_TO_DATE()
- NULL Handling

---

• Skills Demonstrated

- SQL Data Cleaning
- Data Transformation
- Duplicate Detection
- Handling Missing Values
- Data Standardization
- Date Formatting
- SQL Window Functions
- Query Optimization
- Database Management

---

• Learning Outcomes

Through this project, I gained practical experience in:

- Cleaning real-world datasets
- Writing complex SQL queries
- Using window functions for duplicate detection
- Preparing datasets for further analysis

---
