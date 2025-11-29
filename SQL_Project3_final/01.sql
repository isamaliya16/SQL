CREATE TABLE Students (
    StudentID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE
);
INSERT INTO Students(StudentID,FirstName,LastName,Email,BirthDate,EnrollmentDate) 
VALUES
(1,"John","Deo","john.deo@gmail.com","2000-01-15","2022-08-01"),
(2,"Jane","Smith","jane.smith@gmail.com","1999-05-25","2021-08-01")

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY ,
    CourseName VARCHAR(100) NOT NULL, 
    DepartmentID INT NOT NULL,
    Credits INT CHECK (Credits > 0) 
);

INSERT INTO Courses (CourseID,CourseName, DepartmentID, Credits)
VALUES
(101,'Introduction SQL', 1, 3),
(102,'Data Structures', 2, 4)

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY ,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT NOT NULL
  
);
INSERT INTO instructors(InstructorID,FirstName,LastName,Email,DepartmentID) VALUES
(1,"Alice","Johson","alice.johnson@univ.com",1),
(2,"Bob","Lee","bob.lee@univ.com",2)

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,  
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE ,
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Enrollments(EnrollmentID,StudentID,CourseID,EnrollmentDate) VALUES
(1,1,101,"2022-08-01"),
(2,2,102,"2021-08-01")


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY ,  
    DepartmentName VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Departments(DepartmentID,DepartmentName) VALUES
(1,"Computer Science"),
(2,"Mathematics")

-- 1
-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students
SET Email = 'arjun.mehta2023@example.com'
WHERE StudentID = 1;

-- DELETE
DELETE FROM Students
WHERE StudentID = 1;


-- 2
SELECT * FROM students WHERE YEAR(EnrollmentDate) >= 2022;
-- 3
SELECT c.CourseID , c.CourseName FROM Courses c 
JOIN departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentID='Mathematics'
LIMIT 5;


--4 
SELECT c.CourseName , COUNT(e.StudentID) AS StudentCount 
FROM Enrollments e 
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
HAVING COUNT(e.StudentID) > 5 ;  
--5
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (
    SELECT StudentID FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Introduction to SQL'
)
AND s.StudentID IN (
    SELECT StudentID FROM Enrollments e
    JOIN Courses c ON e.CourseID = c.CourseID
    WHERE c.CourseName = 'Data Structures'
);


--6 
SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures');

--7 
SELECT AVG(Credits) as AvgCredits FROM Courses ; 
--8
SELECT MAX(i.Salary) AS MaxSalary
FROM Instructors i
JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- 9
SELECT d.DepartmentName , COUNT(e.StudentID) as StudentCount 
FROM Enrollments e 
JOIN courses c on e.CourseID = c.CourseID
JOIN departments d ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 10
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;

-- 11
SELECT s.FirstName, s.LastName, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c ON e.CourseID = c.CourseID;


-- 12
SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    GROUP BY e.CourseID
    HAVING COUNT(e.StudentID) > 10
);

-- 13
SELECT StudentID, FirstName, LastName, YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

-- 14
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;

-- 15
SELECT c.CourseName,
       COUNT(e.StudentID) AS StudentCount,
       SUM(COUNT(e.StudentID)) OVER (ORDER BY c.CourseName) AS RunningTotal
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName
ORDER BY c.CourseName;

-- 16
SELECT StudentID, FirstName, LastName,
       CASE 
           WHEN DATEDIFF(CURDATE(), EnrollmentDate) / 365 > 4 THEN 'Senior'
           ELSE 'Junior'
       END AS StudentLevel
FROM Students;

