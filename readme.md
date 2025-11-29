<content>
# SQL Query Language — Introduction


---

## Table of contents

1. What is SQL?
2. When & why use SQL
3. Core concepts & terms
4. Example schema
5. Common SQL statements with examples

   * `SELECT`
   * `WHERE`
   * `JOIN`
   * `GROUP BY` / `HAVING`
   * `ORDER BY`
   * `LIMIT` / `OFFSET`
   * `INSERT`, `UPDATE`, `DELETE`
   * `CREATE TABLE`
6. Transactions & safety
7. Indexes & performance tips
8. Best practices
9. Tools & resources
10. License

---

## 1. What is SQL?

SQL (Structured Query Language) is the standard language for interacting with relational databases. It is used to create, read, update, and delete (CRUD) data, as well as to define schema and manage transactions.

---

## 2. When & why use SQL

* When data is structured in tables with relationships (e.g., users, orders, products).
* Provides powerful, declarative queries (express *what* you want, not *how* to traverse).
* ACID-compliant systems (most RDBMSs) guarantee reliable transactions.
* Widely supported by many RDBMS products.

---

## 3. Core concepts & terms

* **Table**: collection of rows (records) and columns (fields).
* **Row**: a single record.
* **Column**: attribute of a record.
* **Primary Key**: unique identifier for a table row.
* **Foreign Key**: column linking to a primary key in another table.
* **Index**: structure to speed up lookups.
* **Schema**: definition of tables, columns, and relationships.

---

## 4. Example schema

We'll use a small e-commerce-like schema: `users`, `products`, `orders`, `order_items`.

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INTEGER DEFAULT 0
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TEXT DEFAULT 'pending',
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
  id INTEGER PRIMARY KEY,
  order_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);
```

---

## 5. Common SQL statements with examples

### SELECT — get data

Select all columns from `users`:

```sql
SELECT * FROM users;
```

Select certain columns:

```sql
SELECT id, name, email FROM users;
```

### WHERE — filter rows

Find users with email at example.com:

```sql
SELECT id, name FROM users
WHERE email LIKE '%@example.com';
```

Numeric filter:

```sql
SELECT * FROM products
WHERE price > 100.00 AND stock > 0;
```

### JOIN — combine tables

Get order info with user and totals:

```sql
SELECT
  o.id AS order_id,
  u.name AS customer,
  o.order_date,
  SUM(oi.quantity * oi.unit_price) AS total_amount
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_items oi ON oi.order_id = o.id
GROUP BY o.id, u.name, o.order_date;
```

### GROUP BY / HAVING — aggregation & filtering groups

Top customers by order count:

```sql
SELECT u.id, u.name, COUNT(o.id) AS orders_count
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
GROUP BY u.id, u.name
HAVING COUNT(o.id) > 5
ORDER BY orders_count DESC;
```

### ORDER BY — sort results

```sql
SELECT * FROM products
ORDER BY price DESC, name ASC;
```

### LIMIT / OFFSET — pagination

```sql
SELECT * FROM products
ORDER BY id
LIMIT 10 OFFSET 20; -- items 21..30
```

### INSERT — add rows

```sql
INSERT INTO users (name, email) VALUES ('Priya Singh', 'priya@example.com');
```

Insert with multiple rows:

```sql
INSERT INTO products (name, price, stock) VALUES
('Watch A', 199.99, 30),
('Watch B', 349.50, 12);
```

### UPDATE — change rows

Reduce stock after purchase:

```sql
UPDATE products
SET stock = stock - 2
WHERE id = 5;
```

### DELETE — remove rows

```sql
DELETE FROM order_items WHERE id = 123;
```

### CREATE TABLE — define schema

(See example schema above.)

---

## 6. Transactions & safety

To ensure multiple statements succeed together, use transactions:

```sql
BEGIN; -- or START TRANSACTION
-- multiple statements, e.g. insert order, update stock
COMMIT; -- or ROLLBACK if error
```

Use parameterized queries in application code to avoid SQL injection (never build SQL by concatenating user input).

---

## 7. Indexes & performance tips

* Add indexes on columns used in `WHERE`, `JOIN`, or `ORDER BY` frequently.
* Example:

  ```sql
  CREATE INDEX idx_products_price ON products(price);
  ```
* Avoid over-indexing (extra indexes slow writes).
* Use `EXPLAIN` (or `EXPLAIN ANALYZE`) to inspect query plans.
* Keep transactions short to reduce locks and contention.

---

## 8. Best practices

* Use meaningful, consistent naming conventions (snake_case or camelCase — pick one).
* Prefer explicit column lists (avoid `SELECT *` in production).
* Use foreign keys to enforce referential integrity.
* Normalize schema to remove data duplication, but denormalize selectively for performance.
* Back up your database regularly.
* Use migrations (Flyway, Liquibase, Alembic, Django migrations) to manage schema changes.

---

## 9. Tools & resources

* Local engines: SQLite (lightweight), PostgreSQL, MySQL, MariaDB.
* GUI tools: DBeaver, pgAdmin, MySQL Workbench, TablePlus.
* Documentation:

  * PostgreSQL docs — official
  * MySQL docs — official
  * SQLite docs — official

---

## 10. Example: Put it together (SQLite quick demo)

```bash
# create SQLite DB and run SQL script (example.sql)
sqlite3 shop.db < example.sql

# run a query interactively
sqlite3 shop.db "SELECT id, name, price FROM products WHERE stock > 0 ORDER BY price;"
```

---

## 11. License

This README is free to use and adapt (MIT-style). Credit welcome but not required.

---

## 12. Next steps / suggestions

* Add sample data SQL (`seed.sql`) to practice queries.
* Convert queries to parameterized examples for your application language (Python, Java, PHP, etc.).
* Add examples for window functions (`ROW_NUMBER()`, `OVER(...)`) and CTEs (`WITH`) for advanced querying.

</content>
