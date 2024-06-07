use EcomDB;
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

select * from Categories  where parent_category_id=7;

INSERT INTO User (first_name, last_name,email ,password_hash) VALUES
('mayar',"mahmoud","mayar120@gmail.com",md5("0127"));
select * from User;

Insert into Products(name,description,price,category_id,stock_quantity)VALUES
('samsung  a50','ram 8 giga storage 256gb','10000.00',2,20),
('Samsung Galaxy S21', 'Latest Samsung flagship phone', 799.99, 2,10),
('Samsung Galaxy Note20', 'High-end Samsung phone with stylus', 999.99, 2,2),
('Samsung Galaxy A51', 'Mid-range Samsung phone', 399.99, 5,4),
('iPhone 12', 'Latest Apple phone', 699.99, 5,5),
('OnePlus 9', 'Latest OnePlus phone', 729.99, 5,12),
('Google Pixel 5', 'Latest Google phone', 699.99, 5,13);

select * from Products;
insert into Orders(user_id,total_amount,order_status) values
(3,250.00,"active");
select * from Orders;

insert into Order_Items(order_id,product_id,quantity,price_at_purchase,totla)values(2,1,20,20000.00,2.0);
select * from Order_Items;

insert into Shopping_Cart(user_id)values(3);
select * from Shopping_Cart;

insert into Payments(order_id,payment_method,payment_status,transaction_id,amount)values(2,"visa","done",md5("50000"),1);
select * from Payments;

insert into Shipping(order_id,address,city,state,zip_code,country,shipping_method,shipping_cost,tracking_number)
values(2,"zayed abu lenaga","bilbies","sharqia","44026","egypt","visa",20000.00,"15");
select *  from Shipping;
 
insert into Reviews(product_id,user_id,rating,comment)values(2,3,4,"good");
select *  from Reviews;
