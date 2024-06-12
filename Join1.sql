USE PharmacyDB7
SELECT 
    i.InvoiceID,
    i.NetTotal,
    i.InvoiceDate,
    c.Name AS CustomerName,
    c.ContactNumber AS CustomerContact,
    o.OrderNumber,
    o.TotalAmount AS OrderTotal
FROM 
    Invoices i
JOIN 
    Customers c ON i.CustomerID = c.CustomerID
JOIN 
    Orders o ON i.InvoiceID = i.InvoiceID;
