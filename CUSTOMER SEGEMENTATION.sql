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