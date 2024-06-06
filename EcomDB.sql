create database EcomDB;
use EcomDB;
create table User(
 user_id int auto_increment primary key,
 first_name varchar(225),
 last_name varchar(255),
 email varchar(255) unique not null,
 password_hash char(32)  not null, 
 role varchar(50) default 'customer',
 created_at TIMESTAMP default current_timestamp,
 updated_at timestamp default current_timestamp on update current_timestamp
);
create table Categories(
 category_id int AUTO_INCREMENT primary key,
 name varchar(255),
 description  text,
 parent_category_id int null,
FOREIGN KEY (parent_category_id) REFERENCES Categories(category_id)
);
create table Products(
 product_id  int AUTO_INCREMENT primary key,
 name varchar(255),
 description text,
 price decimal(10,2),
 category_id int,
 stock_quantity int,
 created_at TIMESTAMP default current_timestamp,
 updated_at timestamp default current_timestamp on update current_timestamp,
 FOREIGN KEY (category_id) REFERENCES Categories(category_id)

);
create table Orders(
  order_id  int AUTO_INCREMENT primary key,
  user_id int,
  total_amount decimal(10,2),
  order_status varchar(50),
  created_at TIMESTAMP default current_timestamp,
 updated_at timestamp default current_timestamp on update current_timestamp,
 FOREIGN KEY (user_id) REFERENCES User(user_id)
  
);
create table Order_Items(
 order_item_id  int AUTO_INCREMENT primary key,
 order_id int,
 product_id int,
 quantity int,
 price_at_purchase decimal(10,2),
 totla decimal (10,2),
 FOREIGN KEY (order_id) REFERENCES Orders(order_id),
 FOREIGN KEY (product_id) REFERENCES Products(product_id)

);
CREATE TABLE Shopping_Cart (
    cart_id int auto_increment PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
create table Cart_Items(
  cart_item_id  int AUTO_INCREMENT primary key,
  cart_id int,
  product_id int,
  quantity int,
  FOREIGN KEY (cart_id) REFERENCES Shopping_Cart(cart_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
create table Payments(
 payment_id  int AUTO_INCREMENT primary key,
 order_id int,
 payment_method varchar(50),
 payment_status varchar(50),
 transaction_id varchar(255),
 amount decimal(10.2),
created_at TIMESTAMP default current_timestamp,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)

);
create table Shipping(
  shipping_id int auto_increment primary key,
  order_id int,
  address text,
  city varchar(255),
   state VARCHAR(255),
    zip_code VARCHAR(20),
    country VARCHAR(255),
    shipping_method VARCHAR(50),
    shipping_cost DECIMAL(10, 2),
    tracking_number VARCHAR(255),
    shipped_at TIMESTAMP,
    delivered_at TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Reviews (
    review_id int auto_increment PRIMARY KEY,
    product_id INT,
    user_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
INSERT INTO Categories (category_id, name,description ,parent_category_id) VALUES
(1, 'Electronics',"devices", NULL),
(2, 'Mobile Phones',"smart", 1),
(3, 'Laptops', "pcs",1),
(4, 'Cameras',"photo", 1),
(5, 'Smartphones', "smart devices",2),
(6, 'Feature Phones', "devices",2),
(7, 'clothes',"clothes", NULL),
(8, 'pants',"smart", 7),
(9, 't shrits', "shirts",7),
(10, 'shirts',"shirts for women", 7),
(11, 'cargo', "for tarning",8),
(12, 'cotton shrits', "cotton for tranning",10);

select * from Categories  where parent_category_id=7