SELECT p.`Product Name`, SUM(od.Quantity) AS Total_Quantity, ROUND(SUM(od.Quantity * od.Price), 2) AS Total_Revenue
FROM `ECommerce.order_details` od
INNER JOIN `ECommerce.products_data` p
ON od.`Product ID` = p.`Product ID`
GROUP BY p.`Product Name`
ORDER BY Total_Revenue DESC,Total_Quantity DESC