USE zepto_db;

-- ==========================================
-- TRIGGER 1: Update Inventory After Order
-- ==========================================

DELIMITER //

CREATE TRIGGER UpdateInventoryAfterOrder

AFTER INSERT ON Order_Items

FOR EACH ROW

BEGIN

UPDATE Inventory

SET stock_quantity =
stock_quantity - NEW.quantity

WHERE product_id = NEW.product_id;

END //

DELIMITER ;



-- ==========================================
-- TRIGGER 2: Order Notification
-- ==========================================

DELIMITER //

CREATE TRIGGER OrderNotification

AFTER INSERT ON Orders

FOR EACH ROW

BEGIN

INSERT INTO Notifications
(
customer_id,
message
)

VALUES
(
NEW.customer_id,
'Your order has been placed successfully'
);

END //

DELIMITER ;



-- ==========================================
-- TRIGGER 3: Payment Notification
-- ==========================================

DELIMITER //

CREATE TRIGGER PaymentNotification

AFTER INSERT ON Payments

FOR EACH ROW

BEGIN

IF NEW.payment_status = 'Success' THEN

INSERT INTO Notifications
(
customer_id,
message
)

SELECT
o.customer_id,
'Payment received successfully'

FROM Orders o

WHERE o.order_id = NEW.order_id;

END IF;

END //

DELIMITER ;



-- ==========================================
-- TRIGGER 4: Low Stock Alert
-- ==========================================

DELIMITER //

CREATE TRIGGER LowStockAlert

AFTER UPDATE ON Inventory

FOR EACH ROW

BEGIN

IF NEW.stock_quantity < 100 THEN

INSERT INTO Notifications
(
customer_id,
message
)

SELECT
1,
CONCAT(
'Low Stock Alert for Product ID: ',
NEW.product_id
);

END IF;

END //

DELIMITER ;



-- ==========================================
-- TRIGGER 5: Review Notification
-- ==========================================

DELIMITER //

CREATE TRIGGER ReviewNotification

AFTER INSERT ON Reviews

FOR EACH ROW

BEGIN

INSERT INTO Notifications
(
customer_id,
message
)

VALUES
(
NEW.customer_id,
'Thank you for submitting your review'
);

END //

DELIMITER ;




Test Trigger
------------
INSERT INTO Orders
(
customer_id,
address_id,
coupon_id,
total_amount,
order_status
)

VALUES
(
1,
1,
1,
500,
'Pending'
);

SELECT *
FROM Notifications;


BEFORE INSERT
AFTER INSERT

BEFORE UPDATE
AFTER UPDATE

BEFORE DELETE
AFTER DELETE
