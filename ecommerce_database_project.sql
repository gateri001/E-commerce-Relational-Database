
mysql> create database ecommerce_app_db
    -> ;
Query OK, 1 row affected (0.02 sec)

mysql> use ecommerce_app_db;
Database changed
mysql> CREATE TABLE products (
    -> product_id INT PRIMARY KEY,
    -> product_name VARCHAR(255) NOT NULL,
    -> price DECIMAL(10,2) NOT NULL,
    -> category_id INT,
    -> FOREIGN KEY(category_id) REFERENCES categories(category_id)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'categories'
mysql> CREATE TABLE products (
    -> product_id INT PRIMARY KEY,
    -> product_name VARCHAR(255) NOT NULL,
    -> price DECIMAL(10,2) NOT NULL,
    -> category_id INT
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> DROP TABLE PRODUCTS;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE products (
    -> product_id INT PRIMARY KEY AUTO_INCREMENT,
    -> product_name VARCHAR(255) NOT NULL,
    -> price DECIMAL(10,2) NOT NULL,
    -> category_id INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE categories(
    -> category_id INT PRIMARY KEY AUTO_INCREMENT,
    -> category_name varchar(255) NOT NULL,
    -> category_description VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE customers(
    -> customer_id INT PRIMARY KEY AUTO_INCREMENT,
    -> customer_name varchar(255) NOT NULL,
    -> email VARCHAR(255) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE orders (
    -> order_id INT PRIMARY KEY AUTO_INCREMENT,
    -> customer_id int,
    -> order_date DATE NOT NULL,
    -> status TEXT NOT NULL,
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 6
mysql> CREATE TABLE orders (
    -> order_id INT PRIMARY KEY AUTO_INCREMENT,
    -> customer_id int,
    -> order_date DATE NOT NULL,
    -> status TEXT NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE payments(
    -> payment_id INT PRIMARY KEY AUTO_INCREMENT,
    -> ORDER_ID INT,
    -> payment_date DATE NOT NULL,
    -> amount DEC(10, 2) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+----------------------------+
| Tables_in_ecommerce_app_db |
+----------------------------+
| categories                 |
| customers                  |
| orders                     |
| payments                   |
| products                   |
+----------------------------+
5 rows in set (0.01 sec)

mysql> create table order_items(
    -> order_items_id INT PRIMARY KEY AUTOINCREMENT,
    -> order_id int,
    -> product_id,
    -> quantity int NOT NULL,
    -> price dec(10,2) not null
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTOINCREMENT,
order_id int,
product_id,
quantity int NOT NULL,
price dec(10,2) ' at line 2
mysql> create table order_items(
    -> order_items_id INT PRIMARY KEY AUTO_INCREMENT,
    -> order_id int,
    -> product_id,
    -> quantity int NOT NULL,
    -> price dec(10,2) not null,
    -> FOREIGN KEY(order_id) REFERENCES orders(order_id),
    -> FOREIGN KEY(product_id) REFERENCES products(product_id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',
quantity int NOT NULL,
price dec(10,2) not null,
FOREIGN KEY(order_id) REFEREN' at line 4
mysql> create table order_items(
    -> order_items_id INT PRIMARY KEY AUTO_INCREMENT,
    -> order_id int,
    -> product_id int,
    -> quantity int NOT NULL,
    -> price dec(10,2) not null,
    -> FOREIGN KEY(order_id) REFERENCES orders(order_id),
    -> FOREIGN KEY(product_id) REFERENCES products(product_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> ALTER TABLE products(
    -> ADD FOREIGN KEY(category_id) REFERENCES category(category_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(
ADD FOREIGN KEY(category_id) REFERENCES category(category_id)' at line 1
mysql> ALTER TABLE products(
    -> ADD FOREIGN KEY(category_id) REFERENCES category(category_id)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(
ADD FOREIGN KEY(category_id) REFERENCES category(category_id)
)' at line 1
mysql> ALTER TABLE products
    -> ADD FOREIGN KEY(category_id) REFERENCES category(category_id)
    -> ;
ERROR 1824 (HY000): Failed to open the referenced table 'category'
mysql> show tables;
+----------------------------+
| Tables_in_ecommerce_app_db |
+----------------------------+
| categories                 |
| customers                  |
| order_items                |
| orders                     |
| payments                   |
| products                   |
+----------------------------+
6 rows in set (0.00 sec)

mysql> ALTER TABLE products
    -> ADD FOREIGN KEY(category_id) REFERENCES categories(category_id);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE ORDERS
    -> ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table payments
    -> add foreign key(order_id) references orders(order_id);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show tables;
+----------------------------+
| Tables_in_ecommerce_app_db |
+----------------------------+
| categories                 |
| customers                  |
| order_items                |
| orders                     |
| payments                   |
| products                   |
+----------------------------+
6 rows in set (0.00 sec)

mysql> describe order_items;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| order_items_id | int           | NO   | PRI | NULL    | auto_increment |
| order_id       | int           | YES  | MUL | NULL    |                |
| product_id     | int           | YES  | MUL | NULL    |                |
| quantity       | int           | NO   |     | NULL    |                |
| price          | decimal(10,2) | NO   |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> describe orders;
+-------------+------+------+-----+---------+----------------+
| Field       | Type | Null | Key | Default | Extra          |
+-------------+------+------+-----+---------+----------------+
| order_id    | int  | NO   | PRI | NULL    | auto_increment |
| customer_id | int  | YES  | MUL | NULL    |                |
| order_date  | date | NO   |     | NULL    |                |
| status      | text | NO   |     | NULL    |                |
+-------------+------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> insert onto categories (category_name, category_description) values
    -> ("electronics", "devices and gadgets"),
    -> ("books", "printed and digital books")
    -> ,("clothing", "apparel and accessories");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'categories (category_name, category_description) values
("electronics", "devices' at line 1
mysql> describe categories;
+----------------------+--------------+------+-----+---------+----------------+
| Field                | Type         | Null | Key | Default | Extra          |
+----------------------+--------------+------+-----+---------+----------------+
| category_id          | int          | NO   | PRI | NULL    | auto_increment |
| category_name        | varchar(255) | NO   |     | NULL    |                |
| category_description | varchar(255) | YES  |     | NULL    |                |
+----------------------+--------------+------+-----+---------+----------------+
3 rows in set (0.05 sec)

mysql> insert into categories (category_name, category_description) values
    -> ("electronics", "devices and gadgets"),
    -> ("books", "printed and digital books"),
    -> ("clothing", "apparel and accessories");
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> describe products;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| product_id   | int           | NO   | PRI | NULL    | auto_increment |
| product_name | varchar(255)  | NO   |     | NULL    |                |
| price        | decimal(10,2) | NO   |     | NULL    |                |
| category_id  | int           | YES  | MUL | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> insert into products (product_name, price, category id) values
    -> (;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id) values
(' at line 1
mysql> insert into products (product_name, price, category_id) values
    -> ("laptop", 1000.00, 1),
    -> ("smartphone", 500.00, 1),
    -> ("t-shirt",20.00,3),
    -> ("novel",15.00,2);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> describe customers;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| customer_id   | int          | NO   | PRI | NULL    | auto_increment |
| customer_name | varchar(255) | NO   |     | NULL    |                |
| email         | varchar(255) | NO   |     | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> insert into customers(customer_name, email)values
    -> ("john", "john@email.com"),
    -> ("jane", "jane@email.com");
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> describe orders;
+-------------+------+------+-----+---------+----------------+
| Field       | Type | Null | Key | Default | Extra          |
+-------------+------+------+-----+---------+----------------+
| order_id    | int  | NO   | PRI | NULL    | auto_increment |
| customer_id | int  | YES  | MUL | NULL    |                |
| order_date  | date | NO   |     | NULL    |                |
| status      | text | NO   |     | NULL    |                |
+-------------+------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> insert into orders(customer_id,order_date,status)values
    -> (1, "2024-01-15","paid"),
    -> (2,"2024-01-20", "unpaid");
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> describe order_items;
+----------------+---------------+------+-----+---------+----------------+
| Field          | Type          | Null | Key | Default | Extra          |
+----------------+---------------+------+-----+---------+----------------+
| order_items_id | int           | NO   | PRI | NULL    | auto_increment |
| order_id       | int           | YES  | MUL | NULL    |                |
| product_id     | int           | YES  | MUL | NULL    |                |
| quantity       | int           | NO   |     | NULL    |                |
| price          | decimal(10,2) | NO   |     | NULL    |                |
+----------------+---------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> insert into order_items(order_id, product_id,quality,price) values
    -> (1,1,1,1000.00),
    -> (1,4,2,30.00),
    -> (2,2,1,500.00);
ERROR 1054 (42S22): Unknown column 'quality' in 'field list'
mysql> insert into order_items(order_id, product_id,quantity,price) values
    -> (1,1,1,1000.00),
    -> (1,4,2,30.00),
    -> (2,2,1,500.00);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> desribe payments;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desribe payments' at line 1
mysql> show tables;
+----------------------------+
| Tables_in_ecommerce_app_db |
+----------------------------+
| categories                 |
| customers                  |
| order_items                |
| orders                     |
| payments                   |
| products                   |
+----------------------------+
6 rows in set (0.01 sec)

mysql> describe payments;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| payment_id   | int           | NO   | PRI | NULL    | auto_increment |
| ORDER_ID     | int           | YES  | MUL | NULL    |                |
| payment_date | date          | NO   |     | NULL    |                |
| amount       | decimal(10,2) | NO   |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> insert into payments(order_id, payment_date, amount) values
    -> (1,"2024-01-15",1600.00);
Query OK, 1 row affected (0.01 sec)

mysql> select * from products;
+------------+--------------+---------+-------------+
| product_id | product_name | price   | category_id |
+------------+--------------+---------+-------------+
|          1 | laptop       | 1000.00 |           1 |
|          2 | smartphone   |  500.00 |           1 |
|          3 | t-shirt      |   20.00 |           3 |
|          4 | novel        |   15.00 |           2 |
+------------+--------------+---------+-------------+
4 rows in set (0.01 sec)

mysql> select * from categories;
+-------------+---------------+---------------------------+
| category_id | category_name | category_description      |
+-------------+---------------+---------------------------+
|           1 | electronics   | devices and gadgets       |
|           2 | books         | printed and digital books |
|           3 | clothing      | apparel and accessories   |
+-------------+---------------+---------------------------+
3 rows in set (0.00 sec)

mysql> select * from orders;
+----------+-------------+------------+--------+
| order_id | customer_id | order_date | status |
+----------+-------------+------------+--------+
|        1 |           1 | 2024-01-15 | paid   |
|        2 |           2 | 2024-01-20 | unpaid |
+----------+-------------+------------+--------+
2 rows in set (0.00 sec)

mysql> select * from customers;
+-------------+---------------+----------------+
| customer_id | customer_name | email          |
+-------------+---------------+----------------+
|           1 | john          | john@email.com |
|           2 | jane          | jane@email.com |
+-------------+---------------+----------------+
2 rows in set (0.00 sec)

mysql> select * from order_items;
+----------------+----------+------------+----------+---------+
| order_items_id | order_id | product_id | quantity | price   |
+----------------+----------+------------+----------+---------+
|              1 |        1 |          1 |        1 | 1000.00 |
|              2 |        1 |          4 |        2 |   30.00 |
|              3 |        2 |          2 |        1 |  500.00 |
+----------------+----------+------------+----------+---------+
3 rows in set (0.00 sec)

mysql> select * from payments;
+------------+----------+--------------+---------+
| payment_id | ORDER_ID | payment_date | amount  |
+------------+----------+--------------+---------+
|          1 |        1 | 2024-01-15   | 1600.00 |
+------------+----------+--------------+---------+
1 row in set (0.00 sec)

mysql> select p.product_name, sum(oi.quantity * oi.price) as total_sales
    -> FROM order_items oi
    -> JOIN products p ON oi.product_id = p.product_id
    -> group_by p.product_name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group_by p.product_name' at line 4
mysql> select p.product_name, sum(oi.quantity * oi.price) as total_sales
    -> FROM order_items oi
    -> JOIN products p ON oi.product_id = p.product_id
    -> group_by p.product_name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'group_by p.product_name' at line 4
mysql> select p.product_name, sum(oi.quantity * oi.price) as total_sales
    -> FROM order_items oi
    -> JOIN products p ON oi.product_id = p.product_id
    -> group by p.product_name;
+--------------+-------------+
| product_name | total_sales |
+--------------+-------------+
| laptop       |     1000.00 |
| novel        |       60.00 |
| smartphone   |      500.00 |
+--------------+-------------+
3 rows in set (0.01 sec)

mysql> select c.customer_name, count(o.order_id) as num_orders
    -> FROM orders o
    -> JOIN customers c ON o.customer_id = c.customer_id
    -> GROUP BY c.customer_name;
+---------------+------------+
| customer_name | num_orders |
+---------------+------------+
| john          |          1 |
| jane          |          1 |
+---------------+------------+
2 rows in set (0.01 sec)

mysql> select o.order_id, sum(p.amount) as total_payments
    -> FROM payments p
    -> JOIN orders o ON p.order_id = o.order_id
    -> GROUP BY o.order_id;
+----------+----------------+
| order_id | total_payments |
+----------+----------------+
|        1 |        1600.00 |
+----------+----------------+
1 row in set (0.00 sec)

mysql> select o.order_id, o.order_date, c.customer_name, o.status
    -> FROM orders o
    -> join customers c ON o.customer_id = c.customer_id
    -> where o.status = "unpaid";
+----------+------------+---------------+--------+
| order_id | order_date | customer_name | status |
+----------+------------+---------------+--------+
|        2 | 2024-01-20 | jane          | unpaid |
+----------+------------+---------------+--------+
1 row in set (0.00 sec)

mysql> SELECT cat.category_name, SUM(oi.quality * oi.price) as total_revenue
    -> FROM order_items oi
    -> JOIN products p ON oi.product_id = p.product_id
    -> JOIN categories cat ON p.category_id = cat.category_id
    -> GROUP BY cat.category_name;
ERROR 1054 (42S22): Unknown column 'oi.quality' in 'field list'
mysql> SELECT cat.category_name, SUM(oi.quantity * oi.price) as total_revenue
    -> FROM order_items oi
    -> JOIN products p ON oi.product_id = p.product_id
    -> JOIN categories cat ON p.category_id = cat.category_id
    -> GROUP BY cat.category_name;
+---------------+---------------+
| category_name | total_revenue |
+---------------+---------------+
| electronics   |       1500.00 |
| books         |         60.00 |
+---------------+---------------+
2 rows in set (0.00 sec)