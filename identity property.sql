create table cust_info(custid int not null,cname varchar(10) not null,orderid int not null,prodid varchar(10) not null)
 insert into cust_info
 values(101,'Ajay',128732,'HB305'),
(102,'Reena',105649,'KA209'),
(101,'Ajay',128732,'HB305'),
(103,'Rakesh',134579,'AG202'),
(105,'Neetha',125768,'AE109'),
(107,'Anita',131274,'GK305'),
(101,'Ajay',128732,'HB305'),
(102,'Reena',105649,'KA209'),
(106,'Romi',132174,'EA102'),
(103,'Rakesh',134579,'AG202')

select * from cust_info

--find out the duplicate custid
select custid,count(custid) as count from cust_info group by custid having COUNT(custid)>1

--delete the records which have duplicate custid keeping original
alter table cust_info add cid int not null identity(1,1)

select * from cust_info order by custid 


select custid,MIN(cid) from cust_info group by custid

delete from cust_info
where cid not in(select MIN(cid) from cust_info group by custid)
select * from cust_info


