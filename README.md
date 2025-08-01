# 🛒 E-commerce Relational Database – MySQL (Project #5)

This project is part of my **#100ProjectsChallenge** to sharpen my skills in SQL and database design by building hands-on mini-projects from scratch.

## 📌 Project Overview

I created a **relational database schema** for a simple e-commerce application using **MySQL**, designed to manage customers, products, orders, payments, and categories.

## 🧱 Database Structure

**Tables Created:**

1. `products`
2. `categories`
3. `customers`
4. `orders`
5. `order_items`
6. `payments`

Each table is connected using **foreign keys** to ensure data integrity.

### 🧬 Entity Relationships:
- Products → Categories (`category_id`)
- Orders → Customers (`customer_id`)
- Order Items → Products & Orders
- Payments → Orders

## 🔧 Features Implemented

- Auto-incrementing primary keys
- Use of `NOT NULL`, `DECIMAL`, `VARCHAR`, and `DATE` types
- Foreign key constraints
- `JOIN` queries across multiple tables
- Aggregate functions and filtering

## 📊 Sample Queries

```sql
-- Total sales by product
SELECT p.product_name, SUM(oi.quantity * oi.price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;

-- Orders that are unpaid
SELECT o.order_id, o.order_date, c.customer_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.status = 'unpaid';

-- Total revenue by category
SELECT cat.category_name, SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;
