USE zepto_db;

-- ==========================================
-- PROCEDURE 1: Get Customer Orders
-- ==========================================

DELIMITER //

CREATE PROCEDURE GetCustomerOrders(
    IN cust_id INT
)

BEGIN

SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status

FROM Orders o

WHERE o.customer_id = cust_id;

END //

DELIMITER ;


-- ==========================================
-- PROCEDURE 2: Get Product Details
-- ==========================================

DELIMITER //

CREATE PROCEDURE GetProductDetails(
    IN prod_id INT
)

BEGIN

SELECT *
FROM Products

WHERE product_id = prod_id;

END //

DELIMITER ;


-- ==========================================
-- PROCEDURE 3: Warehouse Stock Report
-- ==========================================

DELIMITER //

CREATE PROCEDURE WarehouseStock(
    IN warehouseId INT
)

BEGIN

SELECT
    p.product_name,
    i.stock_quantity

FROM Inventory i

JOIN Products p
ON i.product_id = p.product_id

WHERE i.warehouse_id = warehouseId;

END //

DELIMITER ;


-- ==========================================
-- PROCEDURE 4: Customer Payment History
-- ==========================================

DELIMITER //

CREATE PROCEDURE CustomerPaymentHistory(
    IN cust_id INT
)

BEGIN

SELECT
    c.first_name,
    o.order_id,
    p.payment_method,
    p.payment_status

FROM Customers c

JOIN Orders o
ON c.customer_id = o.customer_id

JOIN Payments p
ON o.order_id = p.order_id

WHERE c.customer_id = cust_id;

END //

DELIMITER ;


-- ==========================================
-- PROCEDURE 5: Delivered Orders Report
-- ==========================================

DELIMITER //

CREATE PROCEDURE DeliveredOrders()

BEGIN

SELECT *
FROM Orders

WHERE order_status = 'Delivered';

END //

DELIMITER ;



Test Procedures
---------------
CALL GetCustomerOrders(1);

CALL GetProductDetails(1);

CALL WarehouseStock(1);

CALL CustomerPaymentHistory(1);

CALL DeliveredOrders();