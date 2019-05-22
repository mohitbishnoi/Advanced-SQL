create database joins
create table Region1(Cust_id varchar(10),Cname Varchar(15), Product varchar(20), Price float)
insert into Region1
Select 'A101','AJAY','HTCDes',11700
union select 'B102','RAJESH','MotoG',12499
union select 'D205','VIJAY','MotoX',23999
union select 'C307','SHEILA','iphone4',26000
union select 'E205','ADESH','SGalS3',24499
union select 'J103','LALI','SNote3',41000
union select 'G102','ABHISHEK','HTCOne',50000

Select * from Region1

create table Region2(Cust_id varchar(10),Cname Varchar(15), Product varchar(20), Price float)
insert into Region2
Select 'A101','AJAY','HTCDes',11700
union select 'B103','REENA','MCanvas',19490
union select 'D206','GURU','SGalS5',51300
union select 'C307','SHEILA','iphone4',26000
union select 'K205','SHILPA','SGalS2',22700
union select 'J103','LALI','SNote3',41000
union select 'K109','Anil','NLumia',11000

Select * from Region2

--different type of vertical joins

Select * from Region1 union Select * from Region2

Select * from Region1 union all Select * from Region2

Select * from Region1 Intersect Select * from Region2

Select * from Region1 Except Select * from Region2
