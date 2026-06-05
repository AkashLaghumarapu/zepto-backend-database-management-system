CREATE DATABASE zepto_db;

USE zepto_db;

-- Customers Table

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Addresses Table

CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    house_no VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

-- Categories Table

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- Products Table

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    weight VARCHAR(50),

    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);

-- Warehouses Table

CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    capacity INT
);

-- Inventory Table

CREATE TABLE Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    stock_quantity INT DEFAULT 0,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (warehouse_id)
    REFERENCES Warehouses(warehouse_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

-- Cart Table

CREATE TABLE Cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

-- Coupons Table

CREATE TABLE Coupons (
    coupon_id INT AUTO_INCREMENT PRIMARY KEY,
    coupon_code VARCHAR(50) UNIQUE,
    discount_percentage INT,
    expiry_date DATE
);

-- Orders Table

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    coupon_id INT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(50),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),

    FOREIGN KEY (address_id)
    REFERENCES Addresses(address_id),

    FOREIGN KEY (coupon_id)
    REFERENCES Coupons(coupon_id)
);

-- Order Items Table

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

-- Payments Table

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);

-- Delivery Partners Table

CREATE TABLE Delivery_Partners (
    partner_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_name VARCHAR(100),
    phone VARCHAR(15),
    vehicle_number VARCHAR(20)
);

-- Deliveries Table

CREATE TABLE Deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNIQUE,
    partner_id INT,
    delivery_status VARCHAR(50),
    delivery_time DATETIME,

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (partner_id)
    REFERENCES Delivery_Partners(partner_id)
);

-- Employees Table

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_id INT,
    employee_name VARCHAR(100),
    role VARCHAR(50),
    salary DECIMAL(10,2),

    FOREIGN KEY (warehouse_id)
    REFERENCES Warehouses(warehouse_id)
);

-- Reviews Table

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT CHECK(rating BETWEEN 1 AND 5),
    review_text TEXT,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

-- Notifications Table

CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    message TEXT,
    notification_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);