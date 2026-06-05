USE zepto_db;

-- ==========================================
-- FUNCTION 1: Calculate Discount
-- ==========================================

DELIMITER //

CREATE FUNCTION CalculateDiscount(
    amount DECIMAL(10,2),
    discountPercent INT
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

RETURN amount -
(amount * discountPercent / 100);

END //

DELIMITER ;



-- ==========================================
-- FUNCTION 2: Calculate GST
-- ==========================================

DELIMITER //

CREATE FUNCTION CalculateGST(
    amount DECIMAL(10,2)
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

RETURN amount * 0.18;

END //

DELIMITER ;



-- ==========================================
-- FUNCTION 3: Final Bill Amount
-- ==========================================

DELIMITER //

CREATE FUNCTION FinalBillAmount(
    amount DECIMAL(10,2),
    discountPercent INT
)

RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN

DECLARE discountedAmount DECIMAL(10,2);

SET discountedAmount =
amount - (amount * discountPercent / 100);

RETURN discountedAmount;

END //

DELIMITER ;



-- ==========================================
-- FUNCTION 4: Total Orders By Customer
-- ==========================================

DELIMITER //

CREATE FUNCTION TotalOrdersByCustomer(
    cust_id INT
)

RETURNS INT

READS SQL DATA

BEGIN

DECLARE totalOrders INT;

SELECT COUNT(*)
INTO totalOrders

FROM Orders

WHERE customer_id = cust_id;

RETURN totalOrders;

END //

DELIMITER ;



-- ==========================================
-- FUNCTION 5: Inventory Status
-- ==========================================

DELIMITER //

CREATE FUNCTION InventoryStatus(
    stockQty INT
)

RETURNS VARCHAR(20)

DETERMINISTIC

BEGIN

IF stockQty < 500 THEN
    RETURN 'Low Stock';

ELSE
    RETURN 'Available';

END IF;

END //

DELIMITER ;



Test Functionss
--------------
SELECT CalculateDiscount(1000,20);

SELECT CalculateGST(1000);

SELECT FinalBillAmount(1000,10);

SELECT TotalOrdersByCustomer(1);

SELECT InventoryStatus(300);

SELECT InventoryStatus(1200);