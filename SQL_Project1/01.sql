CREATE TABLE customer (
    customerID INT PRIMARY KEY , 
    name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE, 
    address VARCHAR(255) NOT NULL
);
INSERT INTO customer (customerID, name, email, address)
VALUES 
    (1, 'Ram', 'ram@gmail.com', '123 ABC Heights, Surat'),
    (2, 'Raj', 'raj@gmail.com', '45 Karishna Heights, Surat'),
    (3, 'Priya', 'priya@example.com', '67 Sunrise Plaza, Surat'),
    (4, 'Anil', 'anil@example.com', '89 Palm Grove, Surat'),
    (5, 'Sita', 'sita@example.com', '101 Greenfield Road, Surat'),
    (6, 'Amit', 'amit@example.com', '112 Lotus Lane, Surat');

SELECT * FROM customer;

UPDATE customer SET address='100 New Park Avenue, Surat' WHERE customerID=1;
SELECT * FROM customer;

DELETE FROM customer WHERE customerID=6;

SELECT * FROM customer;

SELECT * FROM customer WHERE name='ram';