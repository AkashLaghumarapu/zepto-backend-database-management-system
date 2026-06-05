USE zepto_db;

-- 1. Display All Customers

SELECT * FROM Customers;

-- 2. Display All Products

SELECT * FROM Products;

-- 3. Product Name and Price

SELECT product_name, price
FROM Products;

-- 4. Products Above ₹50

SELECT *
FROM Products
WHERE price > 50;

-- 5. Sort Products by Price

SELECT *
FROM Products
ORDER BY price DESC;

-- 6. Count Total Customers

SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- 7. Count Total Orders

SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- 8. Total Revenue

SELECT SUM(total_amount) AS Total_Revenue
FROM Orders;

-- 9. Average Order Value

SELECT AVG(total_amount) AS Average_Order_Value
FROM Orders;

-- 10. Highest Order Amount

SELECT MAX(total_amount) AS Highest_Order
FROM Orders;

-- 11. Customer Orders

SELECT
c.first_name,
o.order_id,
o.total_amount,
o.order_status
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- 12. Product Categories

SELECT
p.product_name,
c.category_name
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- 13. Orders with Payment Details

SELECT
o.order_id,
o.total_amount,
p.payment_method,
p.payment_status
FROM Orders o
INNER JOIN Payments p
ON o.order_id = p.order_id;

-- 14. Delivery Information

SELECT
o.order_id,
d.delivery_status,
dp.partner_name
FROM Orders o
INNER JOIN Deliveries d
ON o.order_id = d.order_id
INNER JOIN Delivery_Partners dp
ON d.partner_id = dp.partner_id;

-- 15. Customers and Orders

SELECT
c.first_name,
o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

-- 16. Orders Per Customer

SELECT
customer_id,
COUNT(order_id) AS Total_Orders
FROM Orders
GROUP BY customer_id;

-- 17. Total Sales Per Customer

SELECT
customer_id,
SUM(total_amount) AS Total_Spent
FROM Orders
GROUP BY customer_id;

-- 18. Products Count By Category

SELECT
category_id,
COUNT(product_id) AS Product_Count
FROM Products
GROUP BY category_id;

-- 19. Customers Spending More Than ₹300

SELECT
customer_id,
SUM(total_amount) AS Total_Spent
FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 300;

-- 20. Most Expensive Product

SELECT *
FROM Products
WHERE price =
(
SELECT MAX(price)
FROM Products
);

-- 21. Highest Spending Customer

SELECT *
FROM Customers
WHERE customer_id =
(
SELECT customer_id
FROM Orders
GROUP BY customer_id
ORDER BY SUM(total_amount) DESC
LIMIT 1
);

-- 22. Correlated Subquery

SELECT *
FROM Orders o
WHERE total_amount >
(
SELECT AVG(total_amount)
FROM Orders
WHERE customer_id = o.customer_id
);

-- 23. Low Stock Products

SELECT
product_id,
stock_quantity
FROM Inventory
WHERE stock_quantity < 500;

-- 24. Top Selling Products

SELECT
product_id,
SUM(quantity) AS Total_Sold
FROM Order_Items
GROUP BY product_id
ORDER BY Total_Sold DESC;

-- 25. Monthly Revenue

SELECT
MONTH(order_date) AS Month,
SUM(total_amount) AS Revenue
FROM Orders
GROUP BY MONTH(order_date);

-- 26. Pending Orders

SELECT *
FROM Orders
WHERE order_status='Pending';

-- 27. Delivered Orders

SELECT *
FROM Orders
WHERE order_status='Delivered';

-- 28. Products Never Ordered

SELECT product_name
FROM Products
WHERE product_id NOT IN
(
SELECT product_id
FROM Order_Items
);

-- 29. Customer Order History

SELECT
c.first_name,
o.order_id,
o.order_date,
o.total_amount
FROM Customers c
JOIN Orders o
ON c.customer_id=o.customer_id
ORDER BY o.order_date DESC;

-- 30. Warehouse Stock Report

SELECT
w.warehouse_name,
SUM(i.stock_quantity) AS Total_Stock
FROM Warehouses w
JOIN Inventory i
ON w.warehouse_id=i.warehouse_id
GROUP BY w.warehouse_name;