USE PharmacyDB7
SELECT 
    o.OrderID,
    o.OrderNumber,
    o.OrderDate,
    c.Name AS CustomerName,
    c.ContactNumber AS CustomerContact,
    e.Name AS EmployeeName,
    e.ContactNumber AS EmployeeContact,
    o.TotalAmount,
    o.GrandTotalValue,
    o.PaymentType,
    o.PaymentStatus
FROM 
    Orders o
JOIN 
    Customers c ON c.CustomerID = c.CustomerID
JOIN 
    Employees e ON e.EmployeeID = e.EmployeeID;
