SELECT c.`Customer ID`, CONCAT(c.`First Name`, ' ', c.`Last Name`) AS Full_Name,COUNT(o.`Order ID`) AS Order_Count
FROM `ECommerce.customer_data` c
INNER JOIN `ECommerce.order_data` o
ON c.`Customer ID` = o.`Customer ID`
GROUP BY c.`Customer ID`, Full_Name
ORDER BY Order_Count DESC
LIMIT 10;