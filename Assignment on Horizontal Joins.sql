--9.Write a Query to return all productid, 
--name used in production.product which are also used in sales.salesOrderDetail.

Select distinct pp.ProductID,Name from production.Product as Pp
inner join Sales.SalesOrderDetail as ss on pp.ProductID=ss.ProductID

select * from Production.Product
select * from Sales.SalesOrderDetail

--11. Write a Query that returns productid, name and their corresponding list price
-- for all products that have been sold 
--(Use Production.product and Sales.SalesOrderDetail and write a correlated query)

Select pp.productid,name,ListPrice from Production.Product as pp
inner join Sales.SalesOrderDetail as ss on pp.ProductID=ss.ProductID


--12. Write a Query which returns productid, name where productsubcategoryid is 1 
--and productid is present in Production.Product and Sales.SalesOrderDetail.

select distinct pp.productID, name from Production.Product as pp full join Sales.SalesOrderDetail
as ss on pp.ProductID=ss.ProductID where pp.ProductSubcategoryID=1

--10. Write a Query to return productid, name that were ordered in July 2005.
-- Use Tables Production.product, Sales.SalesOrderDetail and Sales.SalesOrderHeader. 
--(Write using nested Sub-query and joins seperately)

select pp.productid,name from Production.Product as pp
inner join Sales.SalesOrderDetail as ss on pp.ProductID=ss.ProductID
inner join sales.SalesOrderHeader as sh
on ss.SalesOrderID=sh.SalesOrderID
where OrderDate between '07-01-2005' and '07-30-2005'

select * from sales.SalesOrderHeader

--8. Write a Query to return the name of products that have generated sales exceeding
-- two million dollars. Use Tables Production.Product
-- and Sales.SalesOrderDetail (use Exists function, Write Query using Sub-Query and CTE)


select pp.ProductID,name from Production.Product as pp
inner join Sales.SalesOrderDetail as ss
on pp.ProductID=ss.ProductID
group by pp.ProductID,name
having SUM(UnitPrice)>2000000

