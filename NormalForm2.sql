
USE PharmacyDB7
GO

-- Create Tables
CREATE TABLE AdminCredentials1 (
    UserID INT PRIMARY KEY,
    Password VARCHAR(255)
);

CREATE TABLE Users1 (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE Suppliers1 (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Medicines1 (
    MedicineID INT PRIMARY KEY,
    Name VARCHAR(255),
    Packing VARCHAR(50),
    GenericName VARCHAR(255),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Brands1 (
    BrandID INT PRIMARY KEY,
    BrandName VARCHAR(255),
    BrandActive BIT,
    BrandStatus BIT
);

CREATE TABLE Categories1 (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255),
    CategoryActive BIT,
    CategoryStatus BIT
);

CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(255),
    ProdImg VARCHAR(255),
    Quantity INT,
    Rate DECIMAL(10, 2),
    ExpDate DATE,
    AddedDate DATE,
    BrandID INT,
    CategoryID INT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE MedicineStock1 (
    StockID INT PRIMARY KEY,
    MedicineID INT,
    BatchID VARCHAR(50),
    ExpiryDate DATE,
    Quantity INT,
    MRP DECIMAL(10, 2),
    Rate DECIMAL(10, 2),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255),
    DocName VARCHAR(255),
    DocAddress VARCHAR(255)
);

CREATE TABLE Invoices1 (
    InvoiceID INT PRIMARY KEY,
    NetTotal DECIMAL(10, 2),
    InvoiceDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    DiscountAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    OrderNumber VARCHAR(50),
    OrderDate DATE,
    ClientName VARCHAR(255),
    ProjectName VARCHAR(255),
    ClientContact VARCHAR(15),
    Address VARCHAR(255),
    SubTotal DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    Discount DECIMAL(10, 2),
    GrandTotalValue DECIMAL(10, 2),
    GSTN VARCHAR(255),
    Paid DECIMAL(10, 2),
    DueValue DECIMAL(10, 2),
    PaymentType VARCHAR(50),
    PaymentStatus VARCHAR(50),
    PaymentPlace VARCHAR(255),
    DeleteStatus BIT
);

CREATE TABLE OrderItems1 (
    OrderItemID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    Rate DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    OrderID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- Insert Data
INSERT INTO AdminCredentials1 (UserID, Password) VALUES
(1, 'admin123');

INSERT INTO Users1 (UserID, Name, Email, Password) VALUES
(1, 'Admin User', 'admin@example.com', 'admin123'),
(2, 'John Doe', 'john@example.com', 'john123');

INSERT INTO Suppliers1 (SupplierID, Name, ContactNumber, Address, Email) VALUES
(1, 'Desai Pharma', '9948724242', 'Mahim East', 'desai@gmail.com'),
(2, 'BDPL PHARMA', '8645632963', 'Santacruz West', 'bdpl@gmail.com'),
(3, 'Kiran Pharma', '7638683637', 'Andheri East', 'kiranpharma@gmail.com');

-- Insert into Brands first
INSERT INTO Brands1(BrandID, BrandName, BrandActive, BrandStatus) VALUES
(1, 'Cipla', 1, 1),
(2, 'Mankind', 1, 1),
(3, 'Sunpharma', 1, 1),
(4, 'MicroLabs', 1, 1);

-- Insert into Categories first
INSERT INTO Categories1 (CategoryID, CategoryName, CategoryActive, CategoryStatus) VALUES
(1, 'Tablets', 1, 1),
(2, 'Syrup', 1, 1),
(3, 'SkinLiquid', 1, 1),
(4, 'PainKiller', 1, 1);

INSERT INTO Medicines1 (MedicineID, Name, Packing, GenericName, SupplierID) VALUES
(1, 'Nicip Plus', '10tab', 'Paracetamole', 2),
(2, 'Crosin', '10tab', 'Paracetamole', 3),
(3, 'Dolo 650', '15tab', 'Paracetamole', 2),
(4, 'Gelusil', '10tab', 'Mint Flavor', 1);

INSERT INTO Products1 (ProductID, Name, ProdImg, Quantity, Rate, ExpDate, AddedDate, BrandID, CategoryID) VALUES
(1, 'Cipla Inhaler', 'tab.jpg', 50, 30, '2022-02-28', '2022-02-28', 1, 1),
(2, 'Abevia 200 SR Tablet', 'tab1.jpg', 30, 150, '2022-02-16', '2022-02-28', 2, 1),
(3, 'Arpizol 20 Tablet', 'tab3.jpg', 70, 200, '2022-03-13', '2022-02-28', 3, 3),
(4, 'DOLO 650mg', 'tab4.jpg', 500, 25, '2022-05-31', '2022-04-15', 4, 1);

INSERT INTO MedicineStock1 (StockID, MedicineID, BatchID, ExpiryDate, Quantity, MRP, Rate) VALUES
(1, 2, 'CROS12', '2024-12-31', 2, 26.26, 26),
(2, 4, 'G327', '2024-12-31', 0, 15, 12),
(3, 3, 'DOLO327', '2023-01-31', 3, 30, 24),
(4, 1, 'NI325', '2022-05-31', 3, 32.65, 28);

INSERT INTO Customers1 (CustomerID, Name, ContactNumber, Address, DocName, DocAddress) VALUES
(1, 'Kiran Suthar', '1234567690', 'Andheri East', 'Anshari', 'Andheri East'),
(2, 'Aditya', '7365687269', 'Virar West', 'Xyz', 'Kandivali'),
(3, 'Varun Singh', '4637389328', 'Bandra', 'Savita', 'Kandivali'),
(4, 'Saurabh Katkar', '2984683829', 'Virar', 'Saaz', 'Bandra');

INSERT INTO Invoices1 (InvoiceID, NetTotal, InvoiceDate, CustomerID, TotalAmount, DiscountAmount) VALUES
(1, 350.00, '2022-03-25', 1, 380, 30.00),
(2, 450.00, '2022-03-27', 2, 500, 50.00),
(3, 300.00, '2022-04-01', 3, 320, 20.00),
(4, 720.00, '2022-04-10', 4, 750, 30.00);

INSERT INTO Orders1 (OrderID, OrderNumber, OrderDate, ClientName, ProjectName, ClientContact, Address, SubTotal, TotalAmount, Discount, GrandTotalValue, GSTN, Paid, DueValue, PaymentType, PaymentStatus, PaymentPlace, DeleteStatus) VALUES
(1, 'ORD-0001', '2022-03-25', 'Kiran Suthar', '', '2147483647', '', 120, 120, 0, 120, 0, 120, 0, 'Cash', 'Paid', 'Store', 0),
(2, 'ORD-0002', '2022-03-27', 'Aditya', '', '2147483647', '', 100, 100, 0, 100, 0, 100, 0, 'Cash', 'Paid', 'Store', 0),
(3, 'ORD-0003', '2022-04-01', 'Varun Singh', '', '2147483647', '', 860, 860, 0, 860, 0, 860, 0, 'Cash', 'Paid', 'Store', 0),
(4, 'ORD-0004', '2022-04-10', 'Saurabh Katkar', '', '2147483647', '', 60, 60, 0, 60, 0, 60, 0, 'Cash', 'Paid', 'Store', 0);

INSERT INTO OrderItems1 (OrderItemID, ProductID, Quantity, Rate, Total, OrderID) VALUES
(1, 2, 1, 100, 100.00, 1),
(2, 2, 2, 150, 300.00, 2),
(3, 1, 2, 30, 60.00, 3),
(4, 2, 4, 150, 600.00, 3),
(5, 3, 1, 200, 200.00, 3),
(6, 1, 2, 30, 60.00, 4);

INSERT INTO Employees1 (EmployeeID, Name, ContactNumber, Address) VALUES
(1, 'John Smith', '9876543210', '123 Main St'),
(2, 'Jane Doe', '8765432109', '456 Market St');

-- Select Queries to Output All Data
SELECT * FROM AdminCredentials;
SELECT * FROM Users;
SELECT * FROM Suppliers;
SELECT * FROM Medicines;
SELECT * FROM Products;
SELECT * FROM MedicineStock;
SELECT * FROM Brands;
SELECT * FROM Categories;
SELECT * FROM Customers;
SELECT * FROM Invoices;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Employees;
