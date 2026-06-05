USE zepto_db;

-- ==========================================
-- VIEW 1: Customer Order Summary
-- ==========================================

CREATE VIEW Customer_Order_Summary AS

SELECT
c.customer_id,
c.first_name,
c.last_name,
o.order_id,
o.order_date,
o.total_amount,
o.order_status

FROM Customers c

JOIN Orders o
ON c.customer_id = o.customer_id;


-- ==========================================
-- VIEW 2: Product Inventory Report
-- ==========================================

CREATE VIEW Product_Inventory_Report AS

SELECT
p.product_id,
p.product_name,
w.warehouse_name,
i.stock_quantity

FROM Products p

JOIN Inventory i
ON p.product_id = i.product_id

JOIN Warehouses w
ON i.warehouse_id = w.warehouse_id;


-- ==========================================
-- VIEW 3: Payment Report
-- ==========================================

CREATE VIEW Payment_Report AS

SELECT
o.order_id,
o.total_amount,
p.payment_method,
p.payment_status,
p.payment_date

FROM Orders o

JOIN Payments p
ON o.order_id = p.order_id;


-- ==========================================
-- VIEW 4: Delivery Tracking Report
-- ==========================================

CREATE VIEW Delivery_Report AS

SELECT
o.order_id,
dp.partner_name,
d.delivery_status,
d.delivery_time

FROM Orders o

JOIN Deliveries d
ON o.order_id = d.order_id

JOIN Delivery_Partners dp
ON d.partner_id = dp.partner_id;


-- ==========================================
-- VIEW 5: Product Category Report
-- ==========================================

CREATE VIEW Product_Category_Report AS

SELECT
p.product_id,
p.product_name,
c.category_name,
p.price

FROM Products p

JOIN Categories 
ON p.category_id = c.category_id;









Test Views
------------
SELECT * FROM Customer_Order_Summary;

SELECT * FROM Product_Inventory_Report;

SELECT * FROM Payment_Report;

SELECT * FROM Delivery_Report;

SELECT * FROM Product_Category_Report;



