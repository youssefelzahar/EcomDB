use EcomDB;

create   index idx_product_name on Products(name);
create index idx_price_product on Products (price) ;
create index idx_price_category_product on Products (category_id,price) ;
 
 create index idx_order_total_amount on Orders(total_amount);
 create index idx_orders_user_status on Orders(user_id,order_status);
 
 create index idx_order_items_order_product ON Order_Items (order_id, product_id);
 
 
 create index idx_Cart_Items_cart_product ON Cart_Items (cart_id, product_id);
 
 create index idx_payment_status on Payments(payment_status);
 
 create index idx_tracking_shipping on Shipping(tracking_number);
 
 create index idx_reviews_product_user ON Reviews (product_id, user_id);

 show  index from Reviews;
