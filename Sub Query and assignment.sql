select * from SCTY_PRICE
select * from Security
select * from Scty_Tran

--Sub Query -- non correlated

--class assignment Questions

--1.Find out scty_code,company and sedol_code for those records for 
--which market price is less than 500 and pricing factor is less than 100.

Select Scty_code,company,Sedol_code from Security where Scty_code in
(select Sec_id from SCTY_PRICE where Mkt_price<500 and Pricing_factor<100)

--Display those records from scty_price table for which mkt_price is less then average mkt_price
select * from SCTY_PRICE where Mkt_price < (Select avg(Mkt_price) from SCTY_PRICE)


--2.Find out security code,market price,pricing factor for 
--those records for which sedol code is 184732 and 543917.

select Sec_id as Scty_code,Mkt_Price,pricing_factor from SCTY_PRICE 
where Sec_id in (select Scty_code from Security where Sedol_code in (184732,543917))

--3.Find out scty_code ,tin number for which trade date ranges from
-- jan 1,2013 to dec 31,2013 and broker starts with 'i'

select Scty_code,Tin_number from Security where Scty_code in
(select Scty_code from Scty_Tran where Trade_date between '01/01/2013' and '12/31/2013' and Broker like 'i%')

--4.Find out security code, sedol_code for which pricing_factor is 
--less than 100 and Entry_date ranges from jan 1,2009 to jul 31,2013.

Select Scty_code,sedol_code from Security where Scty_code in
(select Sec_id from SCTY_PRICE where Pricing_factor<100 and scty_code in
(select Scty_code from Scty_Tran where Entry_date between '01/01/2009' and '07/31/2013'))

--Non-correlated Subquery using advantureworks2008

use AdventureWorks2008

select * from Production.Product
select * from Sales.SalesOrderHeader
select * from Sales.SalesOrderDetail


--9.Write a Query to return all productid, 
--name used in production.product which are also used in sales.salesOrderDetail.

Select Productid,name from Production.Product as pp where ProductID in 
(select ProductID from Sales.SalesOrderDetail as ss where pp.ProductID=ss.ProductID)

--11. Write a Query that returns productid, name and their corresponding list price
-- for all products that have been sold 
--(Use Production.product and Sales.SalesOrderDetail and write a correlated query)

select productid,name,listprice from Production.Product as pp where pp.ProductID in
(select ss.productid from sales.salesorderdetail as ss where pp.ProductID=ss.ProductID) 

--12. Write a Query which returns productid, name where productsubcategoryid is 1 
--and productid is present in Production.Product and Sales.SalesOrderDetail.

select productid,name from Production.Product  where ProductSubcategoryID=1 and productid in
(select ss.productid from sales.SalesOrderDetail as ss)
--without subquery
select productid,name from Production.Product as pp where pp.ProductSubcategoryID=1


--10. Write a Query to return productid, name that were ordered in July 2005.
-- Use Tables Production.product, Sales.SalesOrderDetail and Sales.SalesOrderHeader. 
--(Write using nested Sub-query and joins seperately)

select pp.ProductID,name from Production.Product as pp where pp.ProductID in
(select ss.productid from sales.SalesOrderDetail as ss where ss.SalesOrderID in
(select sh.salesOrderID from sales.SalesOrderHeader as sh where sh.OrderDate between '07-01-2005' and '07-30-2005')) 

--8. Write a Query to return the name of products that have generated sales exceeding
-- two million dollars. Use Tables Production.Product
-- and Sales.SalesOrderDetail (use Exists function, Write Query using Sub-Query and CTE)

select pp.productid,name from Production.Product as pp where pp.ProductID in
(select ss.productid from sales.SalesOrderDetail as ss where pp.productid=ss.productid 
group by pp.ProductID,name
having SUM(UnitPrice)>2000000)                                



--correlated Query
use Constraints
select * from SCTY_PRICE
select * from Security
select * from Scty_Tran

--1.Find out scty_code,company and sedol_code for those records for 
--which market price is less than 500 and pricing factor is less than 100.

select Scty_code,sedol_code,company from Security as S where EXISTS 
(Select Sec_id from SCTY_PRICE as SP 
where S.Scty_code=SP.Sec_id and Mkt_price<500 and Pricing_factor<100)


--2.Find out security code,market price,pricing factor for 
--those records for which sedol code is 184732 and 543917.

select Sec_id as Scty_code,Mkt_price,pricing_factor from SCTY_PRICE where exists
(select Scty_code from Security where Sec_id=Scty_code and Sedol_code in (184732,543917)) 

--3.Find out scty_code ,tin number for which trade date ranges from
-- jan 1,2013 to dec 31,2013 and broker starts with 'i'

select Scty_code,tin_number from Security as s where exists
(select Scty_code from Scty_Tran as st
where s.Scty_code=st.Scty_code and Trade_date between '01/01/2013' and '12/31/2013' and Broker like 'i%')

--4.Find out security code, sedol_code for which pricing_factor is 
--less than 100 and Entry_date ranges from jan 1,2009 to jul 31,2013.

select Scty_code, sedol_code from Security as s where exists
(select sec_id from SCTY_PRICE as sp where s.Scty_code=sp.Sec_id and Pricing_factor<100 and exists
(select Scty_code from Scty_Tran as st where sp.Sec_id=st.Scty_code and Entry_date between '01/01/2009' and '07/31/2013'))


--correlated Subquery using advantureworks2008
use AdventureWorks2008

select * from Production.Product
select * from Sales.SalesOrderHeader
select * from Sales.SalesOrderDetail

--9.Write a Query to return all productid, 
--name used in production.product which are also used in sales.salesOrderDetail.

select productid,name from Production.Product as pp where exists
(Select ProductID from Sales.SalesOrderDetail as ss where pp.ProductID=ss.ProductID)

--11. Write a Query that returns productid, name and their corresponding list price
-- for all products that have been sold 
--(Use Production.product and Sales.SalesOrderDetail and write a correlated query)

select productid,name,listprice from Production.Product as pp where exists
(select ProductID from Sales.SalesOrderDetail as ss where pp.ProductID=ss.ProductID)

use Constraints

select top 3* from SCTY_PRICE 
order by Mkt_price desc

--
select *, ROW_NUMBER() over (order by mkt_price desc) as R_no from SCTY_PRICE

select *,ROW_NUMBER() over(order by Mkt_price desc) as R_no into #temp_sp from SCTY_PRICE

select Mkt_price from #temp_sp where R_no=3

select * from #temp_sp

select *,ROW_NUMBER() over(order by Pricing_factor desc) as R_no into #temp_sp1 from SCTY_PRICE

select * from #temp_sp1

select Pricing_factor from #temp_sp1 where R_no=2

select *,dense_rank() over(order by Pricing_factor desc) as R_no into #temp_sp2 from SCTY_PRICE

select * from #temp_sp2

select Pricing_factor from #temp_sp2 where R_no=2

select *,rank() over(order by Pricing_factor desc) as R_no into #temp_sp3 from SCTY_PRICE

select * from #temp_sp3

select Pricing_factor from #temp_sp3 where R_no=2

select *,rank() over(order by Pricing_factor desc) as R_no into ##temp_sp3 from SCTY_PRICE


select * from ##temp_sp3