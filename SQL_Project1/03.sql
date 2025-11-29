CREATE TABLE products (
    ProductID INT PRIMARY KEY ,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);
INSERT INTO products (ProductID, ProductName, Price, Stock)
VALUES 
    (1, 'Laptop', 799.99, 50),
    (2, 'Smartphone', 499.99, 120),
    (3, 'Headphones', 89.99, 200),
    (4, 'Wireless Mouse', 25.50, 150),
    (5, 'Keyboard', 45.75, 80),
    (6, 'Monitor', 299.99, 30);


SELECT * FROM products ORDER BY Price DESC ;

UPDATE products SET Price=220 WHERE ProductID = 1;

DELETE FROM products WHERE Stock < 35;

SELECT * FROM products WHERE Price >= 100 and Price <= 500;
SELECT ProductName, Price
FROM products
WHERE Price = (SELECT MAX(Price) FROM products);

SELECT MIN(Price) FROM products; 