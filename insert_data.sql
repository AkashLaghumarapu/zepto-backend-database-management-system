USE zepto_db;

-- Categories

INSERT INTO Categories(category_name)
VALUES
('Fruits'),
('Vegetables'),
('Dairy'),
('Beverages'),
('Snacks'),
('Bakery');

-- Products

INSERT INTO Products
(category_id, product_name, brand, price, weight)
VALUES

(1,'Apple','Fresh Farm',120.00,'1 Kg'),
(1,'Banana','Fresh Farm',60.00,'1 Dozen'),

(2,'Tomato','Organic Farm',40.00,'1 Kg'),
(2,'Potato','Organic Farm',35.00,'1 Kg'),

(3,'Milk','Amul',30.00,'500 ml'),
(3,'Curd','Amul',45.00,'500 g'),

(4,'Coca Cola','Coca Cola',40.00,'750 ml'),
(4,'Sprite','Coca Cola',40.00,'750 ml'),

(5,'Lays Chips','Lays',20.00,'52 g'),
(5,'Kurkure','PepsiCo',20.00,'55 g'),

(6,'Bread','Britannia',45.00,'400 g'),
(6,'Cake','Britannia',120.00,'500 g');

-- Warehouses

INSERT INTO Warehouses
(warehouse_name, city, capacity)
VALUES

('Hyderabad Warehouse','Hyderabad',10000),
('Bangalore Warehouse','Bangalore',12000),
('Chennai Warehouse','Chennai',9000);

-- Inventory

INSERT INTO Inventory
(warehouse_id, product_id, stock_quantity)
VALUES

(1,1,500),
(1,2,700),
(1,3,1000),
(1,4,900),

(2,5,1500),
(2,6,1200),
(2,7,800),
(2,8,600),

(3,9,900),
(3,10,850),
(3,11,700),
(3,12,400);

-- Customers

INSERT INTO Customers
(first_name,last_name,email,phone,password)
VALUES

('Akash','Laghumarapu',
'akash@gmail.com',
'9876543210',
'akash123'),

('Rahul','Sharma',
'rahul@gmail.com',
'9876543211',
'rahul123'),

('Priya','Reddy',
'priya@gmail.com',
'9876543212',
'priya123'),

('Kiran','Kumar',
'kiran@gmail.com',
'9876543213',
'kiran123');

-- Addresses

INSERT INTO Addresses
(customer_id,house_no,street,city,state,pincode)
VALUES

(1,'12-1','Main Road',
'Hyderabad','Telangana','500001'),

(2,'45-2','MG Road',
'Bangalore','Karnataka','560001'),

(3,'78-3','Beach Road',
'Chennai','Tamil Nadu','600001'),

(4,'90-4','Market Street',
'Hyderabad','Telangana','500002');

-- Coupons

INSERT INTO Coupons
(coupon_code,discount_percentage,expiry_date)
VALUES

('WELCOME50',50,'2026-12-31'),
('SAVE20',20,'2026-12-31'),
('NEWUSER30',30,'2026-12-31');

-- Orders

INSERT INTO Orders
(customer_id,address_id,coupon_id,
total_amount,order_status)
VALUES

(1,1,1,350.00,'Delivered'),

(2,2,2,280.00,'Pending'),

(3,3,NULL,450.00,'Packed'),

(4,4,3,620.00,'Out for Delivery');

-- Order Items

INSERT INTO Order_Items
(order_id,product_id,quantity,unit_price)
VALUES

(1,1,2,120.00),
(1,5,1,30.00),

(2,3,4,40.00),
(2,4,2,35.00),

(3,7,3,40.00),
(3,8,2,40.00),

(4,9,5,20.00),
(4,11,2,45.00);

-- Payments

INSERT INTO Payments
(order_id,payment_method,payment_status)
VALUES

(1,'UPI','Success'),
(2,'Credit Card','Pending'),
(3,'UPI','Success'),
(4,'Cash On Delivery','Pending');

-- Delivery Partners

INSERT INTO Delivery_Partners
(partner_name,phone,vehicle_number)
VALUES

('Ravi Kumar',
'9876500001',
'TS09AB1234'),

('Suresh Reddy',
'9876500002',
'KA01XY5678'),

('Mahesh Kumar',
'9876500003',
'TN07CD4321');

-- Deliveries

INSERT INTO Deliveries
(order_id,partner_id,
delivery_status,delivery_time)
VALUES

(1,1,'Delivered',
'2026-06-01 11:30:00'),

(2,2,'Assigned',
NULL),

(3,3,'Picked Up',
NULL),

(4,1,'In Transit',
NULL);

-- Employees

INSERT INTO Employees
(warehouse_id,employee_name,
role,salary)
VALUES

(1,'Ramesh','Manager',50000),

(1,'Kiran','Picker',25000),

(2,'Vijay','Supervisor',45000),

(3,'Anil','Inventory Manager',55000);

-- Reviews

INSERT INTO Reviews
(customer_id,product_id,
rating,review_text)
VALUES

(1,1,5,'Excellent quality'),

(2,3,4,'Fresh vegetables'),

(3,5,5,'Very good milk'),

(4,9,3,'Average taste');

-- Notifications

INSERT INTO Notifications
(customer_id,message)
VALUES

(1,'Order Delivered Successfully'),

(2,'Payment Pending'),

(3,'Order Packed'),

(4,'Order Out For Delivery');