create table customer(CID varchar(10) primary key,cname varchar(10),location varchar(10),order_id int not null,order_date date,price_paid float)
insert into customer
select 'AE2015','AJAY','BLORE',125732,'04/06/2016',30500
union select 'CQ2097','REENA','HYD',129463,'01/05/2016',25999
union select 'GZ1085','RAKESH','CHENNAI',128314,'12/03/2015',40500
union select 'BA1035','RASHID','BLORE',126599,'07/25/2015',18200
union select 'MQ1284','MEENA','PUNE',121281,'02/08/2016',15000
union select 'IA1019','GURU','MUMBAI',126433,'03/05/2015',38250

select * from customer

select cname,location from customer

select * from customer
where location = 'Bangalore' or location='mumbai'

select * from customer where price_paid>=20000 and location = 'blore'

select * from customer
where location in ('bangalore','chennai','mumbai')

select * from customer
where location not in ('pune','mumbai')

select cname,location,order_date from customer
where order_id in(125732,128314)

select * from customer where price_paid >=20000


select * from customer where order_date between '01-jul-2015' and '31-jul-2015'

select * from customer where price_paid between 15000 and 30000

select * from customer where price_paid >15000 and price_paid <30000

select * from customer where price_paid <> 18200 --not<>

--pattern matching in SQl (like)

Select * from customer
where cname like 'R%'

select * from customer
where cname like '%A'

select * from customer
where cname like '%s%'

select * from customer
where cname like '_E%'

select * from customer
where cname like '%A_'

select * from customer
where location like '[A-H]%'

select * from customer
where location like '[^A-H]%'

select * from customer
where location like '%[P-T]'

select * from customer
where location like '[B,C,P]%'

select * from customer
where location like '[%BCP]%'


select price_paid*1.1
from customer

select price_paid * 1.1 as Ten_perc
from customer

select price_paid, price_paid + 1000 as inc_price
from customer

select * from customer

select location from customer

select distinct location from customer

select * from customer

select * from customer order by order_date

select * from customer order by order_Date desc

select * from customer order by location, price_paid desc

select * from customer order by cname, location desc

select top 3* from customer

select top 3 cname from customer
--inserting recordes for few column
insert into customer (CID, order_id)
select 'A1023P', 123455
union select 'A10223', 454323

--transaction control language
begin transaction
update customer
set location = 'Pune' where price_paid  = 40500 

select * from customer

rollback

begin transaction
update customer
set location = 'New Delhi', price_paid = 40000
where cid  = 'MQ1284'


select * from customer
where CID = 'MQ1284'

commit

begin transaction
--delete statement

begin transaction
delete from customer


select * from customer

rollback

begin transaction
delete from customer
where order_date between '01-jul-2015' and '31-dec-2015'

rollback


