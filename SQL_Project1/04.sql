    CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY,
    OrderID INT,                          
    ProductID INT ,                       
    Quantity INT ,                       
    SubTotal DECIMAL(10,2) NOT NULL
    );            
INSERT INTO OrderDetails (OrderDetailsID,OrderID, ProductID, Quantity, SubTotal) 
VALUES 
(1001,11, 101, 2, 500.00),   
(1002,11, 102, 1, 250.00),  
(1003,12, 103, 3, 900.00),  
(1004,13, 104, 5, 1250.00), 
(1005,13, 105, 2, 700.00),  
(1006,14, 106, 4, 1600.00), 
(1007,15, 107, 1, 450.00);  

SELECT * FROM orderdetails;

SELECT * FROM orderdetails WHERE OrderID = 12;

SELECT orderID , SUM(SubTotal) FROM orderdetails GROUP BY OrderID;

SELECT ProductID , SUM(Quantity) as Quantityorder 
FROM orderdetails 
GROUP BY ProductID 
ORDER BY Quantityorder DESC LIMIT 3;
SELECT productID , COUNT(*) as Timesold FROM orderdetails WHERE ProductID=104 GROUP BY ProductID;