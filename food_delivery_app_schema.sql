\-- food\_delivery\_app Schema and Sample Data

CREATE DATABASE IF NOT EXISTS food\_delivery\_app;
USE food\_delivery\_app;

\-- USER TABLE
CREATE TABLE `user` (
`user_id` INT PRIMARY KEY AUTO\_INCREMENT,
`user_name` VARCHAR(255) NOT NULL,
`password` VARCHAR(255) NOT NULL,
`email` VARCHAR(255) NOT NULL UNIQUE,
`address` TEXT,
`role` ENUM('Customer', 'Restaurant Agent', 'Delivery Agent', 'System Agent'),
`created_date` DATETIME DEFAULT CURRENT\_TIMESTAMP,
`last_login_date` DATETIME
);

\-- RESTAURANT TABLE
CREATE TABLE `restaurant` (
`restaurant_id` INT PRIMARY KEY AUTO\_INCREMENT,
`restaurant_name` VARCHAR(255) NOT NULL,
`cousine_type` VARCHAR(255),
`delivery_time` INT,
`address` TEXT,
`admin_user_id` INT,
`rating` DECIMAL(3,2),
`is_active` BOOLEAN DEFAULT TRUE,
`img_path` VARCHAR(255),
FOREIGN KEY (`admin_user_id`) REFERENCES `user`(`user_id`)
);

\-- MENU TABLE
CREATE TABLE `menu` (
`menu_id` INT PRIMARY KEY AUTO\_INCREMENT,
`restaurant_id` INT,
`item_name` VARCHAR(255),
`description` TEXT,
`price` DECIMAL(10,2),
`is_available` BOOLEAN DEFAULT TRUE,
`img_path` VARCHAR(255),
FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`)
);

\-- ORDER TABLE
CREATE TABLE `order_table` (
`order_id` INT PRIMARY KEY AUTO\_INCREMENT,
`user_id` INT,
`restaurant_id` INT,
`order_date` DATETIME DEFAULT CURRENT\_TIMESTAMP,
`total_amount` DECIMAL(10,2),
`status` ENUM("Delivered", "Pending", "Cancel"),
`payment_method` ENUM("COD", "UPI", "Debit Card", "Credit Card"),
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`)
);

\-- ORDER HISTORY TABLE
CREATE TABLE `order_history` (
`order_history_id` INT PRIMARY KEY AUTO\_INCREMENT,
`order_id` INT,
`user_id` INT,
`order_date` DATETIME DEFAULT CURRENT\_TIMESTAMP,
`total_amount` DECIMAL(10,2),
`status` ENUM('Order History', 'Delivery Time', 'Bill Amount'),
FOREIGN KEY (`order_id`) REFERENCES `order_table`(`order_id`),
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);

\-- ORDER ITEM TABLE
CREATE TABLE `order_item` (
`order_item_id` INT PRIMARY KEY AUTO\_INCREMENT,
`order_id` INT,
`menu_id` INT,
`quantity` INT,
`item_total` DECIMAL(10,2),
FOREIGN KEY (`order_id`) REFERENCES `order_table`(`order_id`),
FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`)
);

\-- CART ITEM TABLE
CREATE TABLE `cart_item` (
`cart_item_id` INT PRIMARY KEY AUTO\_INCREMENT,
`user_id` INT,
`restaurant_id` INT,
`menu_id` INT,
`quantity` INT,
`price` DECIMAL(10,2),
FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`),
FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`),
FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`)
);

\-- SAMPLE RESTAURANTS
INSERT INTO restaurant (restaurant\_id, restaurant\_name, cousine\_type, delivery\_time, address, rating, is\_active, img\_path)
VALUES
(1, 'Subway', 'Salads, Sandwiches', 45, '123 Main St', 4.5, 1, 'subway.avif'),
(2, 'Corner House', 'Ice Cream, Desserts', 30, '456 Ice Cream Ave', 4.7, 1, 'corner\_house.avif'),
(3, 'MOJO Pizza', 'Pizza, Italian', 35, '789 Pizza St', 4.3, 1, 'mojo\_pizza.avif'),
(4, 'McDonald''s', 'Burgers, Fast Food', 25, '101 Burger Blvd', 4.0, 1, 'mcDonalds.avif'),
(5, 'UBQ by Barbeque Nation', 'North Indian, BBQ', 50, '202 Grill Rd', 4.6, 1, 'UBQ.avif'),
(6, 'Pizza Hut', 'Pizza, Italian', 40, '303 Cheese Ln', 4.2, 1, 'Pizza\_Hut.avif'),
(7, 'Wow! Momo', 'Tibetan, Momos', 30, '404 Dumpling Dr', 4.4, 1, 'wow\_momo.avif'),
(8, 'Barbeque Nation', 'North Indian, BBQ', 55, '505 Skewer St', 4.5, 1, 'Barbeque\_nation.avif'),
(9, 'KFC', 'Fried Chicken, Fast Food', 30, '606 Bucket Ave', 4.1, 1, 'kfc.avif'),
(10, 'Burger King', 'Burgers, American', 35, '707 Whopper Way', 4.0, 1, 'burgerking.avif'),
(11, 'Wendy''s', 'Burgers, American', 30, '808 Frosty Cir', 4.3, 1, 'wendys.avif'),
(12, 'Domino''s Pizza', 'Pizza, Italian', 45, '909 Delivery Rd', 4.2, 1, 'dominos.avif');

\-- SAMPLE MENU ITEMS
\-- Subway
INSERT INTO menu (restaurant\_id, item\_name, description, price, is\_available, img\_path) VALUES
(1, 'Veggie Delite', 'Fresh veggies on wheat bread', 199.00, 1, 'subway\_veggie.jpg'),
(1, 'Chicken Teriyaki', 'Grilled chicken with sauce', 249.00, 1, 'subway\_chicken.jpg');

\-- Corner House
INSERT INTO menu (restaurant\_id, item\_name, description, price, is\_available, img\_path) VALUES
(2, 'Death by Chocolate', 'Rich chocolate ice cream', 179.00, 1, 'cornerhouse\_chocolate.jpg'),
(2, 'Fruit Sundae', 'Ice cream with fresh fruits', 159.00, 1, 'cornerhouse\_fruit.jpg');

\-- MOJO Pizza
INSERT INTO menu (restaurant\_id, item\_name, description, price, is\_available, img\_path) VALUES
(3, 'Farmhouse Pizza', 'Veggie loaded pizza', 299.00, 1, 'mojo\_farmhouse.jpg'),
(3, 'Pepperoni Pizza', 'Classic pepperoni pizza', 349.00, 1, 'mojo\_pepperoni.jpg');
