# SQL Questions and Answers

This document provides simple and clear answers to common SQL interview and practice questions.

---

## **Q1. What is SQL, and why is it widely used for managing databases?**

**SQL (Structured Query Language)** is a standard programming language used to store, manage, and retrieve data in relational databases.  
It is widely used because it is:

- Easy to learn  
- Standardized across all major DBMS (MySQL, SQL Server, Oracle, PostgreSQL)  
- Powerful for handling large datasets  
- Secure and reliable  

---

## **Q2. Explain the difference between SQL and NoSQL databases.**

| SQL Databases | NoSQL Databases |
|---------------|-----------------|
| Follow a relational model | Follow non-relational formats (Document, Key-Value, Graph, Column-based) |
| Use structured tables | Allow flexible, unstructured data |
| Use SQL language | Use various query methods |
| Best for structured data | Best for large, unstructured, rapidly changing data |
| Vertical scaling | Horizontal scaling |

---

## **Q3. What are some common features of SQL that make it essential for database management?**

- Data storage and retrieval  
- Data filtering using WHERE  
- Sorting (ORDER BY)  
- Grouping & aggregation (GROUP BY, HAVING)  
- Joins between multiple tables  
- Data security  
- Transaction management  

---

## **Q4. What are the four main types of SQL commands, and what is the purpose of each?**

1. **DDL (Data Definition Language)** – Defines database structure  
   - `CREATE`, `ALTER`, `DROP`, `TRUNCATE`

2. **DML (Data Manipulation Language)** – Modifies data  
   - `INSERT`, `UPDATE`, `DELETE`

3. **DCL (Data Control Language)** – Controls access  
   - `GRANT`, `REVOKE`

4. **DQL (Data Query Language)** – Retrieves data  
   - `SELECT`

---

## **Q5. Explain the difference between DDL and DML commands.**

- **DDL commands** change the structure of a database (tables, schema).  
- **DML commands** change the data stored inside the tables.

---

## **Q6. What is the purpose of DCL commands? Provide examples.**

**DCL (Data Control Language)** is used to manage user permissions and database security.

Examples:  
- `GRANT` – Gives access to users  
- `REVOKE` – Removes access from users  

---

## **Q7. What are DQL commands, and how are they used to retrieve data?**

DQL stands for **Data Query Language**.  
It mainly uses the **SELECT** command to retrieve data from one or more tables.

Example:  
```sql
SELECT * FROM employees;
```

---

## **Q8. What are CRUD operations, and why are they important?**

CRUD represents the four basic operations used in databases:

- **C – Create** (INSERT)  
- **R – Read** (SELECT)  
- **U – Update**  
- **D – Delete**

CRUD operations are important because they allow full control over data in any application.

---

## **Q9. Write an SQL query to create a table for storing employee details.**

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

---

## **Q10. Provide an SQL query to insert a new record into a table.**

```sql
INSERT INTO employees (emp_id, name, department, salary)
VALUES (1, 'Ayush', 'IT', 55000);
```

---

## **Q11. How can you retrieve all records from a table?**

```sql
SELECT * FROM employees;
```

---

## **Q12. Write an SQL query to update the salary of an employee.**

```sql
UPDATE employees
SET salary = 65000
WHERE emp_id = 1;
```

---

## **Q13. How do you delete specific rows from a table?**

```sql
DELETE FROM employees
WHERE emp_id = 1;
```

---