use EcomDB;
select p.product_id as product_id, p.name as product_name ,p.description as product_description,p.price as product_price,p.stock_quantity,c.category_id , c.name as category_name ,c.description as description_name from Products as p 
join Categories as c on
p.category_id=c.category_id
where c.name="Mobile Phones";

select o.total_amount,o.order_status, CONCAT(u.first_name," ",u.last_name) as name,u.email from Orders as o
join User as u on
o.user_id=u.user_id;

select  s.address,s.state,s.city,s.tracking_number,CONCAT(u.first_name," ",u.last_name)  as full_name,r.rating,oi.quantity,oi.price_at_purchase,oi.totla,  p.name AS product_name,
    p.description as product_description from Shipping as s
join Orders as o on
s.order_id=o.order_id
join User as u on
o.user_id=u.user_id
join Order_Items as oi on
o.order_id=oi.order_id
join Products as p on
oi.product_id=p.product_id
LEFT JOIN (
    SELECT 
        user_id, 
        MAX(rating) AS rating
    FROM 
        Reviews
    GROUP BY 
        user_id
) r ON u.user_id = r.user_id;

select max(s.shipping_cost) as max_shipping,CONCAT(u.first_name," ",u.last_name)  as full_name from Shipping as s
join Orders as o
on s.order_id=o.order_id
join User as u
on u.user_id=o.user_id
group by full_name
order by max_shipping desc




