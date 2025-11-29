CREATE TABLE orders (
    OrderID INT PRIMARY KEY, 
    CustomerID INT, 
    OrderDate DATE NOT NULL, 
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(customerID)
);
INSERT into orders (OrderID,CustomerID,OrderDate,TotalAmount)VALUES
(1, 1, '2025-09-01', 150.50),
(2, 2, '2025-09-02', 89.99),
(3, 3, '2025-09-05', 200.00),
(4, 4, '2025-09-10', 49.75),
(5, 5, '2025-09-12', 320.00),
(6, 1,'2025-07-11', 100.10),
(7, 2,'2025-08-11', 150.25);
SELECT * FROM orders;

SELECT * FROM orders WHERE CustomerID = 2

UPDATE orders SET TotalAmount=51.25 WHERE CustomerID=4;

DELETE FROM orders WHERE OrderID = 4;
SELECT * FROM orders;

SELECT * FROM orders WHERE OrderDate > CURDATE() - 30;
SELECT 
    MAX(TotalAmount) AS HighestOrderAmount,
    MIN(TotalAmount) AS LowestOrderAmount,
    AVG(TotalAmount) AS AverageOrderAmount
FROM orders;
