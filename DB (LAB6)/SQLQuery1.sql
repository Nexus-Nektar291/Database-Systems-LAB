-- Task 1 :
Select Customers.CustomerID,(Select top 1 OrderID from Orders order by OrderID) as OrderID,
(Select top 1 OrderDate from Orders order by OrderID) as OrderDate
from Customers

-- Task 2 :
Select Customers.CustomerID,(Select top 1 OrderID from Orders where Customers.CustomerID = Orders.CustomerID
order by OrderID) as OrderID,
(Select top 1 OrderDate from Orders where Customers.CustomerID = Orders.CustomerID
order by OrderID) as OrderDate
from Customers
where NOT EXISTS(
Select OrderID
from Orders
where Customers.CustomerID = Orders.CustomerID
)

-- Task 3 :
Select Customers.CustomerID,(Select top 1 OrderID from Orders where Orders.CustomerID = Customers.CustomerID 
and OrderDate is not null and MONTH(OrderDate) = 07 and YEAR(OrderDate) = 1997 order by orderid desc) as OrderID,
(Select top 1 OrderDate from Orders	where Orders.CustomerID = Customers.CustomerID and OrderDate is not null
and MONTH(OrderDate) = 07 and YEAR(OrderDate) = 1997 ORDER BY OrderID desc) as OrderDate
from Customers where exists(select 1 from Orders where Orders.CustomerID = Customers.CustomerID 
and MONTH(OrderDate) = 07 and YEAR(OrderDate) = 1997)

-- Task 4 :
Select Customers.CustomerID,
(
	Select Count(*)
	from Orders
	where Customers.CustomerID = Orders.CustomerID
) as TotalOrders
from Customers

-- Task 5 :
Select e.EmployeeID,e.FirstName,e.LastName
from Employees e,
(
	Select 1 AS n Union Select 2 Union Select 3 Union Select 4 Union Select 5
) as copies
order by EmployeeID

-- Task 6 :
Select Products.ProductID
from Products
where exists
(
Select OrderID from [Order Details] where products.ProductID = [Order Details].ProductID
and (UnitPrice * Quantity) > (
	select avg(UnitPrice * Quantity)from [Order Details]
	)
)
order by ProductID

-- Task 7 :
Select top 1 * 
from Products 
where UnitPrice<
(
	select Max(unitPrice) 
	from Products
)
order by UnitPrice desc

-- Task 8 :
Select Employees.EmployeeID,(
	Select top 1 OrderDate from Orders	where Employees.EmployeeID = Orders.EmployeeID
	and day(OrderDate) = 04	and (month(OrderDate) = 7 or month(OrderDate) = 8)and (year(OrderDate) = 1996 or year(OrderDate) = 1997)
) 
as Dates from Employees where exists( Select top 1 OrderDate from Orders where Employees.EmployeeID = Orders.EmployeeID
	and day(OrderDate) = 04	and (month(OrderDate) = 7 or month(OrderDate) = 8)
	and (year(OrderDate) = 1996 or year(OrderDate) = 1997)
)

-- Task 9 : 
Select CustomerID,(	Select Count(*)	from Orders	where Customers.CustomerID = Orders.CustomerID
and Customers.Country = 'USA'
) as TotalOrders,
(Select Sum(Quantity) from [Order Details] where OrderID in	(
		Select OrderID from Orders where Customers.CustomerID = Orders.CustomerID 
		and Customers.Country = 'USA'
	)
) as TotalQuantity
from Customers
where country = 'USA'

-- Task 10 :
Select Customers.CustomerID,Customers.CompanyName,
(
	Select top 1 OrderID
	from Orders
	where Customers.CustomerID = Orders.CustomerID
	and day(OrderDate) = 4 and month(OrderDate) = 7 and year(OrderDate) = 1997
) as OrderID,
(
	Select top 1 OrderDate
	from Orders
	where Customers.CustomerID = Orders.CustomerID
	and day(OrderDate) = 4 and month(OrderDate) = 7 and year(OrderDate) = 1997
) as OrderDate
from Customers
where CustomerID in(
	Select CustomerID
	from Orders
	where Customers.CustomerID = Orders.CustomerID
	and day(OrderDate) = 4 and month(OrderDate) = 7 and year(OrderDate) = 1997
)

-- Task 12 :
Select E1.FirstName + E1.LastName,(DATEDIFF(hour,E1.BirthDate,GETDATE())/8766) as Age,
(
	Select (DATEDIFF(hour,E2.BirthDate,GETDATE())/8766)
	from Employees E2
	where E1.ReportsTo = E2.EmployeeID 
	and E1.BirthDate < E2.BirthDate 
) as ManagerAge
from Employees E1
where E1.EmployeeID <>
(
	Select E3.EmployeeID
	from Employees E3
	where E1.ReportsTo = E3.EmployeeID 
	and E1.BirthDate < E3.BirthDate 
)

-- Task 13 :
Select P.ProductName,
(
	Select top 1 o.OrderDate
	from Orders o
	where o.OrderID in 
	(
		Select o1.OrderID
		from [Order Details] o1
		where o1.ProductID = P.ProductID
	)
) as OrderDate
from Products P
where ProductID in
(
	Select ProductID 
	from [Order Details]
	where [Order Details].OrderID in 
	(
		Select Orders.OrderID
		from Orders
		where year(OrderDate) = 1997
		and month(OrderDate) = 8
		and day(OrderDate) = 8
	)
)

-- Task 14 : 
Select ShipAddress,ShipCity,ShipCountry
from Orders
where Orders.EmployeeID in
(
	Select Employees.EmployeeID
	from Employees
	where FirstName = 'Anne'
	and Orders.RequiredDate < Orders.ShippedDate
)

-- Task 15 :
Select distinct(ShipCountry)
from Orders
where OrderID =
(
	Select top 1 OrderID
	from [Order Details]
	where [Order Details].OrderID = Orders.OrderID
	and ProductID =
	(
		Select top 1 ProductID
		from Products
		where Products.ProductID = [Order Details].ProductID
		and CategoryID = 1
	)
)