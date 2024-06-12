CREATE TABLE OrderDetails1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ClientName VARCHAR(255),
    ProjectName VARCHAR(255),
    ClientContact VARCHAR(15),
    Address VARCHAR(255),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE CustomerDoctorInfo1 (
    CustomerID INT PRIMARY KEY,
    DocName VARCHAR(255),
    DocAddress VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Insert data into OrderDetails
INSERT INTO OrderDetails1 (OrderID, CustomerID, ClientName, ProjectName, ClientContact, Address)
VALUES
(1, 1, 'Santosh Kadam', '', '2147483647', 'Islamabad'),
(2, 2, 'Aishwarya Joshi', '', '2147483647', 'Lahore'),
(3, 3, 'Saurabh Katkar', '', '2147483647', 'Lahore'),
(4, 3, 'Saurabh Katkar', '', '2147483647', 'Islamabad');

-- Insert data into CustomerDoctorInfo
INSERT INTO CustomerDoctorInfo1 (CustomerID, DocName, DocAddress)
VALUES
(1, 'Anshari', 'Andheri East'),
(2, 'Xyz', 'Virar West'),
(3, 'Dr Kapoor', 'Dadar East');
select * from OrderDetails1;
select * from CustomerDoctorInfo1;