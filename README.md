# E-commerce SQL Queries

This repository contains SQL queries written for analyzing e-commerce data using **Google BigQuery**. The queries cover topics like customer segmentation, product revenue analysis, and loyalty metrics.

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
3. Paste the queries into the SQL editor and run them on your dataset.

## Prerequisites

- You need access to **Google BigQuery** with a dataset similar to:
  - `customer_data`: Contains information like `Customer ID`, `First Name`, `City`, etc.
  - `order_data`: Contains `Order ID`, `Customer ID`, `Total Amount`, etc.
  - `order_details`: Contains `Order ID`, `Product ID`, `Quantity`, `Price`, etc.
