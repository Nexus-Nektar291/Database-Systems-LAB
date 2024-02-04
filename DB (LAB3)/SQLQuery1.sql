-- Task # 1 : 
select * 
from Orders
where (RequiredDate - ShippedDate) < 0

-- Task # 2 : 
select distinct Country
from Employees

-- Task # 3 : 
select FirstName+' '+LastName
from Employees
where ReportsTo is null

-- Task # 4 :
select ProductName
from Products
where Discontinued = 1

-- Task # 5 : 
select OrderID 
from [Order Details]
where Discount = 0

-- Task # 6 : 
select ContactName 
from Customers
where Region is NULL

-- Task # 7 : 
select ContactName , Phone
from Customers
where Country = 'USA' or Country = 'UK'

-- Task # 8 :
select CompanyName
from Suppliers
where HomePage IS NOT NULL

-- Task # 9 : 
select ShipCountry
from Orders
where year(ShippedDate) = 1997

-- Task # 10 : 
select CustomerID
from Orders
where ShippedDate is null

-- Task # 11 : 
select SupplierID,CompanyName,City
from Suppliers

-- Task # 12 : 
select *
from Employees
where City = 'London'

-- Task # 13 :
select ProductName
from Products
where Discontinued <> 1

-- Task # 14 :
select OrderID 
from [Order Details]
where Discount <= 0.1

-- Task # 15 : 
select EmployeeID, FirstName+' '+LastName, HomePhone, Extension
from Employees
where Region is null
