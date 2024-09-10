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