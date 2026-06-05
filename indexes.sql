USE zepto_db;

-- ==========================================
-- INDEX 1: Product Name Search
-- ==========================================

CREATE INDEX idx_product_name
ON Products(product_name);



-- ==========================================
-- INDEX 2: Order Date Search
-- ==========================================

CREATE INDEX idx_order_date
ON Orders(order_date);





-- ==========================================
-- INDEX 4: Inventory Product Search
-- ==========================================

CREATE INDEX idx_inventory_product
ON Inventory(product_id);



-- ==========================================
-- INDEX 5: Order Status Search
-- ==========================================

CREATE INDEX idx_order_status
ON Orders(order_status);



-- ==========================================
-- INDEX 6: Payment Status Search
-- ==========================================

CREATE INDEX idx_payment_status
ON Payments(payment_status);



-- ==========================================
-- INDEX 7: Delivery Status Search
-- ==========================================

CREATE INDEX idx_delivery_status
ON Deliveries(delivery_status);




Verify indexess
-----------------
SHOW INDEX FROM Products;

SHOW INDEX FROM Orders;

SHOW INDEX FROM Customers;

SHOW INDEX FROM Inventory;

SHOW INDEX FROM Payments;

SHOW INDEX FROM Deliveries;