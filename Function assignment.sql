select 'Business'+'-'+'Today'+'-'+'India'

create table email(First_name varchar(20),Middle_name varchar(20), Last_name varchar(20), Doamin_name varchar(30))
insert into email
select 'Rama','Krishnan','Iyar','nikhilanalytics.com'

select * from email

select SUBSTRING(First_name,1,3),LEFT(Middle_name,2),+'.'+RIGHT(Last_name,2),+'@'+LEFT(Doamin_name,19) as email from email

select STUFF('Microsoft',4,2,'Apple')

select substring('London Olympics',3,7)

select len('Silicon Valley of India')

select COUNT(*) from SCTY_PRICE

select REVERSE('Independence Day')

select LTRIM('       india    ')
select RTRIM('       Russia    ')

select MIN(Price_paid), MAX(Price_paid),stdev(price_paid),VAR(price_paid),SUM(price_paid) from customer


--No arithmetic operation is possible with null


select ISNULL(null,20) --if first value is null then it will be replaced by second numeric value

select nullif(10,10) --if both the value are same then it will show null

select coalesce(null,10,null)


select * from customer
select ISNULL(order_date,getdate()) from customer


SELECT COALESCE(NULL, NULL, 100, NULL, 85)

SELECT NULLIF(0, NULL)


--find out the total market price and average market price using scty_price table

select SUM(mkt_price) as total, AVG(Mkt_price) as average from SCTY_PRICE

--find out total market price and average market price for each currency using scty_price table.
select SUM(Mkt_price) as total, AVG(Mkt_price) as Average from SCTY_PRICE group by currency
select * from SCTY_PRICE

--find out count of scty_code from each broker using scty_tran table
select broker, COUNT(scty_code) as count
from Scty_Tran
group by Broker

--find out total market price and average market price for each currency for which average market price is greater then 100
select Currency,SUM(Mkt_price) as total, AVG(Mkt_price) as average from SCTY_PRICE
group by currency
having AVG(mkt_price)>100 

--find out total market price and average market price for each currency for which 
--total market price less than 100 and currency are AUD, GBP and USD
select currency,SUM(Mkt_price) as total, AVG(Mkt_price) as average from SCTY_PRICE
 group by currency
 having SUM(Mkt_price)<100 and currency in ('AUD','GBP','USD')