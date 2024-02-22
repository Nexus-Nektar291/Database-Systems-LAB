-- Task 1 : 
select ProductName
from Products 
where UnitPrice > (
	select AVG(unitprice)
	from Products
);

-- Task 2 : 
select ShippedDate,COUNT(*) as numberoforders 
from Orders 
group by ShippedDate 
having ShippedDate is not null 
order by ShippedDate

-- Task 3 : 
select Country 
from Suppliers 
group by Country
having count(*) >= 2

-- Task 4 :
select MONTH(shippeddate)as MonthNumber,COUNT(*) as OrdersDelayed 
from Orders 
where ShippedDate > RequiredDate
group by month(ShippedDate)

-- Task 5 :
select OrderID , SUM(discount) as Discount 
from [Order Details] 
group by OrderID
having sum(Discount) > 0

-- Task 6 : 
 select ShipCity,COUNT(*) as NumberOfOrders
 from Orders
 where ShipCountry = 'USA' and YEAR(ShippedDate) = '1997'
 group by ShipCity 
 
 -- Task 7 : 
 select ShipCountry as Country , COUNT(*) as OrdersDelayed 
 from Orders
 where ShippedDate > RequiredDate
 group by ShipCountry

 -- Task 8 : 
select OrderID , SUM(discount) as Discount , SUM(unitprice) as TotalPrice
from [Order Details]
group by OrderID
having SUM(discount) > 0

-- Task 9 : 
select ShipRegion,ShipCity,COUNT(*) as NumberOfOrders 
from Orders
where YEAR(ShippedDate) = '1997' and ShipRegion is not null
group by ShipRegion,ShipCity