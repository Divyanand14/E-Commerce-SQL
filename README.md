# E-commerce SQL Queries

This repository contains SQL queries written for analyzing e-commerce data using **Google BigQuery**. The queries cover topics like customer segmentation, product revenue analysis, and loyalty metrics.

## Source Data

The following source data files are included in the `data` folder:

1. **customers.csv**: Contains customer information such as `Customer ID`, `First Name`, `Last Name`, `City`, and `State`.
2. **orders.csv**: Contains order-level data such as `Order ID`, `Customer ID`, `Total Amount`, and `Order Date`.
3. **products.csv**: Contains product information such as `Product ID`, `Product Name`, `Category`, and `Price`.

These datasets are used for running the SQL queries in this repository. You can load these files into your database (e.g., BigQuery) to replicate the analysis.

## Queries Included

- **Check for NULL Values**: SQL queries that check for missing values in key columns (e.g., `Customer ID`, `Order ID`, etc.).
- **Customers by State**: Analyze the number of customers from each state.
- **Most Loyal Customers**: Identify the top 10 customers based on the number of orders they’ve placed.
- **Top Spending Customers and Cities**: Analyze which customers and cities generate the highest total spending.
- **Products by Revenue**: Identify the top products based on total revenue and quantity sold.
- **Customer Segmentation**: Segment customers into high, medium, and low spenders, and find the top city for each segment.

## How to Use

1. Copy the SQL queries from the `.sql` files.
2. Open the **BigQuery Console** in your Google Cloud Platform account.
3. Upload the csv files to the database
4. Paste the queries into the SQL editor and run them on your dataset.


