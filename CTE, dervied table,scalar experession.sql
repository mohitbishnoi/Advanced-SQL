select * from Security

select date_inc,scty_Code,company
into #sec1
from Security
where Head_office in ('bangalore','mumbai','chennai')

select * from #sec1


---cte (temp table created only to execute the query and then memory is freed)

with third_rec as 
(select *,ROW_NUMBER() over(order by mkt_price desc) as r_no
from SCTY_PRICE
)select * from third_rec where r_no=3

select * from third_rec


--derived table- select statement in your from clause

select * from (Select *,ROW_NUMBER() over (order by mkt_price desc) as r_no from SCTY_PRICE) as a
where r_no=3

--below statement will not work because execution flow fails
select *,ROW_NUMBER() over (order  by mkt_price desc) as r_no
from SCTY_PRICE
where r_no=3

--using sales.salesorderdetail --adventureworks database

--1. find out productid,unitprice
use AdventureWorks2008

select productid,unitprice from Sales.SalesOrderDetail

--2. average unit price of above table

select AVG(unitprice) from Sales.SalesOrderDetail

--3. find out productid,unitprice, average unitprice of the table

select Productid,unitprice,AVG(unitprice) as average from sales.SalesOrderDetail group by ProductID,UnitPrice


--scalar expression--combining the row wise operation with coloum wise operation

select productid,unitprice,(select avg(unitprice) from Sales.SalesOrderDetail) as average 
from Sales.SalesOrderDetail

--4. find productid,unitprice,average unitprice and didfference between unitprice & average unitprice
--of the table
select productid,unitprice,(select avg(unitprice) from Sales.SalesOrderDetail) as average,
(UnitPrice-(select AVG(unitprice) from Sales.SalesOrderDetail)) as difference
from Sales.SalesOrderDetail




