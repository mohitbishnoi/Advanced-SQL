select * from customer

select AVG(price_paid)
from customer

select AVG(price_paid) as average_price
from customer

select AVG(price_paid) as average_price, MAX(price_paid) as maximum_price,MIN(price_paid) as minimum_price
from customer

select COUNT(*) as cnt_rec, COUNT(cname) as cnt_name
from customer

select STDEV(price_paid) from customer

select var(price_paid) from customer

--date function
select GETDATE() as time_Date

select * from customer

select order_date, DAY(order_date) as day, MONTH(order_date) as month
from customer

select order_date, DATEPART(QUARTER,order_date) as qtr, DATEPART(week, order_date) as week
from customer

select order_date, DATEDIFF(YEAR,order_date,GETDATE()) as year from customer

select order_date, DATEDIFF(MONTH,order_date,GETDATE()) as Months from customer

select order_date, DATEDIFF(DAY,order_date,GETDATE()) as day from customer

select order_date, DATEDIFF(QUARTER,order_date,GETDATE()) as quarter from customer

select order_date, DATEADD(Day,10,order_date) as delevery_date from customer

--string functions

select LOWER(cname) as low_cname from customer

select UPPER(cname) as up_cname from customer

select 'good'+' '+'morning'
select concat('good',null,'morning') --for newer version

select '#'+ LTRIM('           Mohit            ')+'#'

select '#'+ RTRIM('             Mohit             ')+'#'

select '#'+ trim('               Mohit             ')+'#' --for newer version

select cname, SUBSTRING(cname,2,3) as sub,LEFT(cname,2) as l_sub, RIGHT(cname,2) as r_sub 
from customer

select REPLACE('honululu','lu','ma')

select STUFF('honululu',5,2,'delhi')

select LEN('bangalore')
select LEN('new delhi')

select REVERSE('bangalore')
select REVERSE('new delhi')

--isnull 

select * from customer

select *, ISNULL(cname,'missing') as new_cn from customer

select *, ISNULL(price_paid, 0) as new_pp from customer

select ISNULL(null,20)
select ISNULL(20,null)
select ISNULL(10,20)
select ISNULL(null,getdate())

--nullif

select nullif(10,10)
select nullif('Monday','Monday')
select nullif('Tuesday','Monday')
select nullif(0,null)
select nullif(null,0)
select nullif('21-jul-2019','jul-21-2019')

--coalesce

select coalesce(null,null,null)
select coalesce(10,20,20)
select coalesce(null,20,30)
select coalesce(null,null,30)
SELECT COALESCE(NULL, NULL, 100, NULL, 85)



