--CHECKING FOR NULL VALUES IN KEY COLUMNS
select *from `ECommerce.customer_data`
where Email is NULL or `Customer ID` is NULL

select *from `ECommerce.order_data`
where 'Order ID' is null

select *from `ECommerce.order_details`
'Product ID' is null

--CUSTOMERS BY STATE
select State,count(State) as Num_of_Customers
from `ECommerce.customer_data`
group by State
order by  Num_of_Customers desc

--MOST LOYAL CUSTOMERS
SELECT c.`Customer ID`, CONCAT(c.`First Name`, ' ', c.`Last Name`) AS Full_Name,COUNT(o.`Order ID`) AS Order_Count
FROM `ECommerce.customer_data` c
INNER JOIN `ECommerce.order_data` o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY c.`Customer ID`, Full_Name
ORDER BY Order_Count DESC
LIMIT 10;

--TOP 10 SPENDING CUSTOMERS AND CITIES
SELECT CONCAT(c.`First Name`, ' ', c.`Last Name`) AS Full_Name,c.State,c.City,
ROUND(SUM(o.`Total Amount`),2) AS Total_Spending
FROM `ECommerce.customer_data` c
INNER JOIN `ECommerce.order_data` o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY Full_Name, c.State, c.City
ORDER BY Total_Spending DESC
LIMIT 10;

SELECT c.City,c.State,ROUND(SUM(o.`Total Amount`),2) AS Total_Spending
FROM `ECommerce.customer_data` c
INNER JOIN `ECommerce.order_data` o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY c.City, c.State
ORDER BY Total_Spending DESC
LIMIT 10;

-- PRODUCTS BY REVENUE
SELECT p.`Product Name`, SUM(od.Quantity) AS Total_Quantity, ROUND(SUM(od.Quantity * od.Price), 2) AS Total_Revenue
FROM `ECommerce.order_details` od
INNER JOIN `ECommerce.products_data` p
ON od.`Product ID` = p.`Product ID`
GROUP BY p.`Product Name`
ORDER BY Total_Revenue DESC,Total_Quantity DESC

--CUSTOMER SEGEMENTATION
WITH SpendingCategories AS (
SELECT c.`Customer ID`,CONCAT(c.`First Name`, ' ', c.`Last Name`) AS Full_Name,c.`City`,
CASE
  WHEN SUM(o.`Total Amount`) > 1000 THEN 'High Spender'
  WHEN SUM(o.`Total Amount`) BETWEEN 500 AND 1000 THEN 'Medium Spender'
  ELSE 'Low Spender'
  END AS Spending_Category
FROM `ECommerce.customer_data` c
INNER JOIN `ECommerce.order_data` o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY c.`Customer ID`, Full_Name, c.`City`
),
CityConcentration AS (
SELECT Spending_Category, c.`City`,COUNT(*) AS Customer_Count,
ROW_NUMBER() OVER (PARTITION BY Spending_Category ORDER BY COUNT(*) DESC) AS City_Rank
FROM SpendingCategories c
GROUP BY Spending_Category, c.`City`
)
SELECT Spending_Category, City, Customer_Count
FROM CityConcentration
WHERE City_Rank = 1
ORDER BY 
  CASE
    WHEN Spending_Category = 'High Spender' THEN 1
    WHEN Spending_Category = 'Medium Spender' THEN 2
    ELSE 3
  END;

