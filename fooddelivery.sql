create database fooddeliveryapp;
drop database fooddeliveryapp;
-- 1. Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(100),
    phone_number VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users (username, email, password, phone_number, address) VALUES
('Arun Kumar', 'arun.kumar@example.com', 'password123', '9876543210', 'Chennai, Tamil Nadu'),
('Lakshmi Priya', 'lakshmi.priya@example.com', 'password123', '9876543211', 'Coimbatore, Tamil Nadu'),
('Ravi Shankar', 'ravi.shankar@example.com', 'password123', '9876543212', 'Madurai, Tamil Nadu'),
('Meena Kumari', 'meena.kumari@example.com', 'password123', '9876543213', 'Tiruchirappalli, Tamil Nadu'),
('Suresh Babu', 'suresh.babu@example.com', 'password123', '9876543214', 'Salem, Tamil Nadu'),
('Anitha Rani', 'anitha.rani@example.com', 'password123', '9876543215', 'Tirunelveli, Tamil Nadu'),
('Vijay Kumar', 'vijay.kumar@example.com', 'password123', '9876543216', 'Erode, Tamil Nadu'),
('Divya Bharathi', 'divya.bharathi@example.com', 'password123', '9876543217', 'Vellore, Tamil Nadu'),
('Karthik Raja', 'karthik.raja@example.com', 'password123', '9876543218', 'Thoothukudi, Tamil Nadu'),
('Priya Dharshini', 'priya.dharshini@example.com', 'password123', '9876543219', 'Dindigul, Tamil Nadu'),
('Manoj Kumar', 'manoj.kumar@example.com', 'password123', '9876543220', 'Thanjavur, Tamil Nadu'),
('Sangeetha Devi', 'sangeetha.devi@example.com', 'password123', '9876543221', 'Karur, Tamil Nadu'),
('Rajesh Kumar', 'rajesh.kumar@example.com', 'password123', '9876543222', 'Nagapattinam, Tamil Nadu'),
('Deepa Lakshmi', 'deepa.lakshmi@example.com', 'password123', '9876543223', 'Kanchipuram, Tamil Nadu'),
('Mohan Raj', 'mohan.raj@example.com', 'password123', '9876543224', 'Pudukkottai, Tamil Nadu');
select*from Users;
-- 2. Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    phone_number VARCHAR(15),
    rating DECIMAL(2,1),
    open_time TIME,
    close_time TIME
);
INSERT INTO Restaurants (name, address, phone_number, rating, open_time, close_time) VALUES
('Anjappar Chettinad', 'No. 12, Anna Salai, Chennai, Tamil Nadu', '9876543210', 4.5, '10:00', '23:00'),
('Saravana Bhavan', 'No. 18, Ranganathan Street, T. Nagar, Chennai, Tamil Nadu', '9876543211', 4.3, '07:00', '22:00'),
('Murugan Idli Shop', 'No. 16, Besant Road, Triplicane, Chennai, Tamil Nadu', '9876543212', 4.2, '06:00', '22:00'),
('Junior Kuppanna', 'No. 8, Race Course Road, Coimbatore, Tamil Nadu', '9876543213', 4.4, '11:00', '23:00'),
('Madurai Kumar Mess', 'No. 22, Alagarkoil Road, Madurai, Tamil Nadu', '9876543214', 4.6, '11:00', '23:00'),
('Kariakudi Chettinad Mess', 'No. 10, Karur Main Road, Tiruchirappalli, Tamil Nadu', '9876543215', 4.5, '11:00', '22:30'),
('A2B (Adyar Ananda Bhavan)', 'No. 34, MG Road, Salem, Tamil Nadu', '9876543216', 4.3, '07:00', '23:00'),
('Sree Annapoorna', 'No. 2, NSR Road, Saibaba Colony, Coimbatore, Tamil Nadu', '9876543217', 4.4, '07:00', '22:00'),
('Thalappakatti', 'No. 28, Gandhipuram, Coimbatore, Tamil Nadu', '9876543218', 4.5, '11:00', '23:00'),
('Dindigul Venu Biryani', 'No. 9, Collector Office Road, Dindigul, Tamil Nadu', '9876543219', 4.7, '11:00', '22:30'),
('Sangeetha Veg Restaurant', 'No. 24, Mount Road, Chennai, Tamil Nadu', '9876543220', 4.2, '07:00', '22:00'),
('Hotel Sree Krishna', 'No. 15, Pondy Bazaar, T. Nagar, Chennai, Tamil Nadu', '9876543221', 4.3, '07:00', '22:00'),
('Amirtham Vegetarian', 'No. 19, VOC Road, Tuticorin, Tamil Nadu', '9876543222', 4.4, '07:00', '22:00');
select*from Restaurants;
-- 3. MenuItems Table
CREATE TABLE MenuItems (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(5,2),
    is_available BOOLEAN,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO MenuItems (restaurant_id, name, description, price, is_available) VALUES
(1, 'Idli', 'Steamed rice cakes served with sambar and chutney', 20.00, TRUE),
(1, 'Dosa', 'Crispy rice and lentil crepe served with sambar and chutney', 35.00, TRUE),
(1, 'Vada', 'Deep-fried savory doughnuts made from urad dal', 15.00, TRUE),
(2, 'Pongal', 'Savory rice and moong dal dish with ghee, pepper, and cashews', 40.00, TRUE),
(2, 'Upma', 'Savory semolina porridge cooked with vegetables and spices', 30.00, TRUE),
(2, 'Sambar Rice', 'Rice mixed with sambar, a tangy lentil stew with vegetables', 50.00, TRUE),
(3, 'Rasam Rice', 'Rice mixed with a spicy and tangy tamarind soup', 45.00, TRUE),
(3, 'Curd Rice', 'Rice mixed with yogurt, tempered with mustard seeds and curry leaves', 35.00, TRUE),
(3, 'Kuzhi Paniyaram', 'Spicy rice batter dumplings cooked in a special mold', 25.00, TRUE),
(4, 'Parotta', 'Layered flatbread made from maida flour, served with salna', 25.00, TRUE),
(4, 'Biryani', 'Fragrant rice dish cooked with spices, meat, or vegetables', 120.00, TRUE),
(4, 'Kothu Parotta', 'Minced parotta mixed with meat, eggs, and spices', 80.00, TRUE),
(5, 'Payasam', 'Sweet pudding made from milk, rice, and jaggery', 50.00, TRUE);
select*from MenuItems;
-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    total_amount DECIMAL(7,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivery_address TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
INSERT INTO Orders (user_id, restaurant_id, total_amount, delivery_address) VALUES
(1, 1, 500.00, 'Chennai, Tamil Nadu'),
(2, 2, 750.00, 'Coimbatore, Tamil Nadu'),
(3, 3, 600.00, 'Madurai, Tamil Nadu'),
(4, 4, 450.00, 'Tiruchirappalli, Tamil Nadu'),
(5, 5, 800.00, 'Salem, Tamil Nadu'),
(6, 6, 550.00, 'Tirunelveli, Tamil Nadu'),
(7, 7, 700.00, 'Erode, Tamil Nadu'),
(8, 8, 650.00, 'Vellore, Tamil Nadu'),
(9, 9, 900.00, 'Thoothukudi, Tamil Nadu'),
(10, 10, 850.00, 'Dindigul, Tamil Nadu');

select*from Orders;
-- 5. OrderItems Table
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);
INSERT INTO OrderItems (order_id, item_id, quantity, price) VALUES
(1, 1, 2, 40.00),  -- 2 Idlis for Order 1
(1, 2, 1, 35.00),  -- 1 Dosa for Order 1
(2, 3, 3, 45.00),  -- 3 Vadas for Order 2
(2, 4, 1, 40.00),  -- 1 Pongal for Order 2
(3, 5, 2, 60.00),  -- 2 Upmas for Order 3
(3, 6, 1, 50.00),  -- 1 Sambar Rice for Order 3
(4, 7, 2, 90.00),  -- 2 Rasam Rice for Order 4
(4, 8, 1, 35.00),  -- 1 Curd Rice for Order 4
(5, 9, 3, 75.00),  -- 3 Kuzhi Paniyaram for Order 5
(5, 10, 2, 50.00), -- 2 Parottas for Order 5
(6, 11, 1, 120.00),-- 1 Biryani for Order 6
(6, 12, 1, 80.00), -- 1 Kothu Parotta for Order 6
(7, 13, 2, 100.00);-- 2 Payasam for Order 7
select*from OrderItems;
-- 6. DeliveryDrivers Table
CREATE TABLE DeliveryDrivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    vehicle_number VARCHAR(20),
    current_location TEXT,
    rating DECIMAL(2,1)
);
INSERT INTO DeliveryDrivers (name, phone_number, vehicle_number, current_location, rating) VALUES
('Arun Kumar', '9876543210', 'TN01AB1234', 'Chennai', 4.7),
('Vijay Raj', '9876543211', 'TN02CD5678', 'Coimbatore', 4.5),
('Praveen', '9876543212', 'TN03EF9012', 'Madurai', 4.6),
('Ramesh', '9876543213', 'TN04GH3456', 'Tiruchirappalli', 4.4),
('Karthik', '9876543214', 'TN05IJ7890', 'Salem', 4.8),
('Suresh', '9876543215', 'TN06KL1234', 'Erode', 4.5),
('Murugan', '9876543216', 'TN07MN5678', 'Tirunelveli', 4.3),
('Balaji', '9876543217', 'TN08OP9012', 'Vellore', 4.6),
('Manikandan', '9876543218', 'TN09QR3456', 'Thoothukudi', 4.7),
('Sathish', '9876543219', 'TN10ST7890', 'Dindigul', 4.5),
('Mohan', '9876543220', 'TN11UV1234', 'Karur', 4.4),
('Ganesh', '9876543221', 'TN12WX5678', 'Nagapattinam', 4.8),
('Saravanan', '9876543222', 'TN13YZ9012', 'Thanjavur', 4.7);
select*from DeliveryDrivers;
-- 7. DeliveryStatus Table
CREATE TABLE DeliveryStatus (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    driver_id INT,
    status VARCHAR(50),
    estimated_time TIME,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (driver_id) REFERENCES DeliveryDrivers(driver_id)
);
INSERT INTO DeliveryStatus (order_id, driver_id, status, estimated_time) VALUES
(1, 1, 'Delivered', '2024-08-24 18:30:00'),
(2, 2, 'Out for Delivery', '2024-08-24 19:00:00'),
(3, 3, 'Preparing', '2024-08-24 18:45:00'),
(4, 4, 'Delivered', '2024-08-24 18:50:00'),
(5, 5, 'Out for Delivery', '2024-08-24 19:15:00'),
(6, 6, 'Preparing', '2024-08-24 19:05:00'),
(7, 7, 'Delivered', '2024-08-24 18:55:00'),
(8, 8, 'Out for Delivery', '2024-08-24 19:20:00'),
(9, 9, 'Preparing', '2024-08-24 19:10:00'),
(10, 10, 'Delivered', '2024-08-24 19:25:00');

select*from DeliveryStatus;
-- 8. Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    transaction_id VARCHAR(100),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
INSERT INTO Payments (order_id, payment_method, payment_status, transaction_id) VALUES
(1, 'Credit Card', 'Completed', 'TXN1234567890'),
(2, 'Debit Card', 'Pending', 'TXN2345678901'),
(3, 'PayPal', 'Completed', 'TXN3456789012'),
(4, 'Net Banking', 'Failed', 'TXN4567890123'),
(5, 'UPI', 'Completed', 'TXN5678901234'),
(6, 'Credit Card', 'Pending', 'TXN6789012345'),
(7, 'Debit Card', 'Completed', 'TXN7890123456'),
(8, 'PayPal', 'Failed', 'TXN8901234567'),
(9, 'Net Banking', 'Completed', 'TXN9012345678'),
(10, 'UPI', 'Pending', 'TXN0123456789');

select*from Payments;
-- 9. Reviews Table
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    item_id INT,
    rating DECIMAL(2,1),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (item_id) REFERENCES MenuItems(item_id)
);
INSERT INTO Reviews (user_id, restaurant_id, item_id, rating, review_text) VALUES
(1, 1, 1, 4.5, 'Delicious and well-prepared food. The service was excellent.'),
(2, 2, 2, 3.8, 'Good taste but the portion size was small.'),
(3, 3, 3, 4.0, 'Great ambiance and tasty food. Will visit again.'),
(4, 4, 4, 4.2, 'Loved the flavors, but the wait time was long.'),
(5, 5, 5, 3.5, 'Average experience. The food was okay, but nothing special.'),
(6, 6, 6, 4.7, 'Amazing dishes and friendly staff. Highly recommend!'),
(7, 7, 7, 3.9, 'Good experience overall, but the prices were high.'),
(8, 8, 8, 4.3, 'Fantastic food with a variety of options.'),
(9, 9, 9, 4.6, 'The best meal I’ve had in a long time. Highly satisfied.'),
(10, 10, 10, 4.0, 'Tasty food but the ambiance could be better.'),
(11, 11, 11, 3.7, 'Decent food, but the service needs improvement.'),
(12, 12, 12, 4.8, 'Exceptional quality and presentation. Will definitely come back.'),
(13, 13, 13, 4.4, 'Very good food with quick service. Worth the visit.');

select*from Reviews;
-- 10. Coupons Table
CREATE TABLE Coupons (
    coupon_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(50),
    discount_percentage DECIMAL(5,2),
    max_discount DECIMAL(7,2),
    valid_until DATE
);

INSERT INTO Coupons (code,  discount_percentage, max_discount, valid_until) VALUES
('PONGAL23', 20, 200, '2024-01-17'),
('THAIPUSAM',  15, 150, '2024-02-08'),
('TAMILNEWYEAR',  25, 250, '2024-04-14'),
('CHITHIRAI23', 10, 100, '2024-04-20'),
('AADI18',  18, 180, '2024-08-17'),
('AVANI23',  22, 220, '2024-09-10'),
('NAVARATRI23', 30, 300, '2024-10-10'),
('DEEPAVALI23', 35, 350, '2024-11-10'),
('KARTHIGAI23', 15, 150, '2024-12-05'),
('MARGAZHI23',  20, 200, '2024-12-31'),
('THIRUVIZHA23', 25, 250, '2024-08-25'),
('MAHAPOOSAI23',  18, 180, '2024-09-20'),
('KANDHASASTI23',  28, 280, '2024-10-28'),
('VAIKUNTA23',  12, 120, '2024-12-22'),
('THIRUPPAVAI23',22, 220, '2024-12-31'),
('MAATTU23',  20, 200, '2024-01-16'),
('KAVADDI23', ' 18, 180, '2024-02-18');

select*from Coupons;
