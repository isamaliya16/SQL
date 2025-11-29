CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATE NOT NULL
);

INSERT INTO customers(CustomerID,FirstName,LastName,Email,RegistrationDate) VALUES
(1,"John","Doe","johndeo@gmail.com","2022-03-15"),
(2,"Jane","Smith","janesmith@gmail.com","2021-11-02")

SELECT * FROM customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY ,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT into orders(OrderID,CustomerID,OrderDate,TotalAmount) VALUES
(101,1,"2023-07-01",150.50),
(102,2,"2023-07-03",200.75)

SELECT * FROM orders;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

INSERT INTO employees(EmployeeID,FirstName,LastName,Department,HireDate,Salary) VALUES
(1,"Mark","Johnson","Sales","2020-01-15",50000.00),
(2,"Susan","Lee","HR","2021-03-20",55000.00)

SELECT * FROM employees;


-- 1
SELECT c.firstName , c.LastName , c.Email , c.RegistrationDate,
        o.OrderDate,o.TotalAmount FROM customers c
        INNER JOIN orders o ON c.CustomerID = o.CustomerID;

-- 2
SELECT c.CustomerID,c.FirstName,c.LastName,c.Email,
    o.OrderID,o.OrderDate,o.TotalAmount
    FROM Customers c
    LEFT JOIN Orders o  
    ON c.CustomerID = o.CustomerID;

-- 3
SELECT 
    o.OrderID,o.OrderDate,o.TotalAmount,
    c.CustomerID,
    c.FirstName,c.LastName,c.Email
    FROM Customers c
    RIGHT JOIN Orders o 
    ON c.CustomerID = o.CustomerID;
-- 4
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o  
    ON c.CustomerID = o.CustomerID
UNION
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o  
    ON c.CustomerID = o.CustomerID;

-- 5
SELECT c.CustomerID, c.FirstName, c.LastName, c.Email
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);
-- 6
SELECT * FROM employees WHERE Salary > ( SELECT AVG(Salary) FROM employees);
-- 7
SELECT OrderID , YEAR(OrderDate) as orderyear , MONTH(OrderDate) as ordermonth  FROM orders;
-- 8
SELECT OrderID, OrderDate, CURDATE() ,DATEDIFF(CURDATE() , OrderDate) as DaysDifference FROM orders; 
-- 9
SELECT OrderID , CustomerID , DATE_FORMAT(OrderDate , '%d-%M-%Y') as formattedDate FROM orders ;
-- 10
SELECT CustomerID , CONCAT(FirstName , ' ' ,LastName) AS Full_name FROM customers;
-- 11
SELECT CustomerID,FirstName,LastName,REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName FROM Customers;
-- 12
SELECT CustomerID,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower,
    Email,
    RegistrationDate
FROM Customers;
-- 13
SELECT CustomerID,FirstName,LastName,
    TRIM(Email) AS TrimmedEmail
FROM Customers;

-- 14
SELECT OrderID,CustomerID,OrderDate,TotalAmount,SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderID) AS RunningTotal FROM Orders;

-- 15
SELECT OrderID, CustomerID, OrderDate, TotalAmount, RANK() OVER(ORDER BY TotalAmount) FROM orders 

-- 16
SELECT orderID, CustomerID,TotalAmount, 
    CASE 
        WHEN TotalAmount > 200 THEN '10% Off'
        WHEN TotalAmount > 100 THEN '5% Off' 
        ELSE 'No Discount'
    END AS discount
FROM orders;

-- 17 
SELECT EmployeeID,FirstName,LastName,Department,Salary,
    CASE
        WHEN Salary >= 51000 THEN 'High'
        WHEN Salary >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
