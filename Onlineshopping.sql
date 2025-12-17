create database online_shopping1; 
use online_shopping1;
 create table products(product_id int primary key,name varchar(200),price int,stock int,category varchar(200));
 create table customers(customer_id int primary key, name varchar (200),email varchar(200),phone varchar(100)); 
 create table orders(order_id int primary key,customer_id int, foreign key(customer_id) references customers(customer_id),order_date  DATE DEFAULT(CURRENT_DATE)
,totalamount int);
 create table orderdetails(orderdetail_id int,order_id int,foreign key(order_id) references orders(order_id),product_id int ,foreign key (product_id) references products(product_id),quantity int);
 INSERT INTO products VALUES 
 (1,'Laptop',55000,10,'Electronics'), 
 (2,'Mobile',20000,25,'Electronics'), 
 (3,'Headphones',1500,50,'Accessories'),
 (4,'Shoes',2500,40,'Footwear'),
 (5,'Watch',3000,20,'Accessories'),
 (6,'T-shirt',600,70,'Clothing'),
 (7,'Jeans',1200,30,'Clothing'),
 (8,'Mixer',3500,15,'Home Appliances'),
 (9,'Television',40000,7,'Electronics'),
(10,'Bag',900,45,'Accessories');
 INSERT INTO customers VALUES 
 (1,'Aisha Khan','aisha@gmail.com','9876543210'),
 (2,'Rahul Mehta','rahul.mehta@gmail.com','9988776655'),
 (3,'Sneha R','sneha_r@yahoo.com','8899001122'),
 (4,'Arjun Sharma','arjun@gmail.com','7766554433'),
 (5,'Priya Singh','priya@yahoo.com','9900112233'),
 (6,'Mohit Jain','mohit@gmail.com','8800223344'),
 (7,'Divya Patel','divya@gmail.com','9090909090'),
 (8,'Karan Kumar','karan@hotmail.com','9812345678'),
 (9,'Meera N','meera@gmail.com','7001234567'),
 (10,'Ravi Verma','ravi@yahoo.com','6009876543');
 INSERT INTO orders VALUES
 (1, 1, '2025-11-01', 45000),
 (2, 2, '2025-11-05', 23000),
 (3, 1, '2025-11-10', 1500),
 (4, 3, '2025-11-15', 3500),
 (5, 4, '2025-11-20', 8000),
 (6, 5, '2025-11-25', 12000),
 (7, 6, '2025-11-28', 600),
 (8, 7, '2025-11-30', 1200),
 (9, 8, '2025-12-01', 9000),
 (10, 9, '2025-12-02', 16000);
 INSERT INTO orderdetails VALUES
 (1, 1, 1, 1),
 (2, 1, 3, 2),
 (3, 2, 2, 1),
 (4, 3, 3, 1),
 (5, 4, 4, 2),
 (6, 5, 5, 1),
 (7, 6, 6, 3),
 (8, 7, 7, 1),
 (9, 8 , 8, 1),
 (10, 9, 9, 1);
 SELECT 
    p.product_id,
    p.Name,
    SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Name
ORDER BY TotalSold DESC
LIMIT 5;
SELECT *
FROM orders
WHERE order_date <= CURRENT_DATE - INTERVAL 30 DAY;
use online_shopping1;
select  SUM(totalamount)as total_revenue
FROM orders;  






 
 
 