-- Task1 : 
select Customers.CustomerID,Orders.OrderID,Orders.OrderDate
from Customers left join Orders
on Customers.CustomerID = Orders.CustomerID;

-- Task2 :
select Customers.CustomerID,Orders.OrderID,Orders.OrderDate
from Customers left join Orders
on Customers.CustomerID = Orders.CustomerID 
where Orders.OrderID is null;

-- Task3 : 
select CustomerID, OrderID, OrderDate 
from Orders 
where month(OrderDate) = '07' and year(OrderDate) = '1997';

-- Task 4: 
select Customers.CustomerID, count(Orders.OrderID) as TotalOrders 
from Customers Left Join Orders 
on Customers.CustomerID = Orders.CustomerID 
group by Customers.CustomerID;

-- Task5 :
select Employees.EmployeeID, Employees.FirstName, Employees.LastName 
from Employees cross join
(select top(5) * from Employees)as Copies
order by Employees.EmployeeID;

-- Task 6 :
select EmployeeID, day(HireDate) as Dated
from Employees
where HireDate >= '04-07-1996' and HireDate <= '04-08-1997';

-- Task 7:
select Customers.CustomerID, count(Orders.OrderID) as TotalOrders, 
sum([Order Details].Quantity) as TotalQuantity
from Customers 
Join Orders on Customers.CustomerID = Orders.CustomerID 
join [Order Details] on Orders.OrderID = [Order Details].OrderID
where Customers.Country = 'USA'
group by Customers.CustomerID;

-- Task 8 :
Select Customers.CustomerID, Customers.CompanyName, Orders.OrderID, Orders.OrderDate
From Customers left join Orders on Customers.CustomerID = Orders.CustomerID
where (Orders.OrderDate) = '1997-07-04'; 

-- Task 10 :
Select E.FirstName, E.BirthDate as EmployeeAge, M.BirthDate as ManagerAge
From Employees E Join Employees M On E.ReportsTo = M.EmployeeID 
where E.BirthDate < M.BirthDate;

-- Task 11 :
Select Products.ProductName , Orders.OrderDate 
From Orders 
join [Order Details] on Orders.OrderID = [Order Details].OrderID
join Products on [Order Details].ProductID = Products.ProductID 
where Orders.OrderDate = '08-08-1997';

-- Task 12 :
Select Orders.ShipAddress, Orders.ShipCity, Orders.ShipCountry
From Orders join Employees on Employees.EmployeeID = Orders.EmployeeID
where Employees.FirstName = 'Anne' and Orders.ShippedDate > Orders.RequiredDate;

-- Task 13 :
Select Distinct Orders.ShipCountry
From Products
join [Order Details] on Products.ProductID = [Order Details].ProductID 
join Orders on [Order Details].OrderID = Orders.OrderID 
join Categories on Categories.CategoryID = Products.CategoryID
where Categories.CategoryName = 'Beverages';