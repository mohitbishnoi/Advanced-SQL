create table employee(empid int,ename varchar(20),DOJ Date)
select * from employee

insert into employee(empid,ename,DOJ)
select 101,'SONY','01-01-2019'

insert into employee
select 102, 'Megha','01-10-2019'

insert into employee(empid,ename)
select 103,'ARUN'

truncate table employee
Select * from scty_price

insert into scty_price
Select 'HCL205','07/17/13',487.39,'INR',1
Union select 'HDFC305','07/15/13',1187.15,'INR',1
Union select 'HUL109','03/23/13',20,'USD',100
Union select 'ICIC201','06/24/12',50,'GBP',150
Union select 'INC501','01/10/11',15,'SGD',50
Union select 'INF409','04/01/12',25,'USD',100
Union select 'Mar408','07/05/09',1257.39,'PKR',0.7
Union select 'Ran208','05/11/08',112,'CHF',80
Union select 'TCS103','09/08/07',114,'AUD',90
Union select 'WIP309','10/05/08',120,'AUD',90

insert into Security
Select 'ICIC201','ICICI','ICICI Bank','MA304IC',247382,'Mumbai','04/25/89'
Union select 'HDFC305','HDFC','HDFC Bank','K0102HD',543917,'kolkata','06/07/91'
Union select 'HUL109','HUL','HUL Ltd','k0197HL',189732,'kolkata','01/01/95'
Union select 'Ran208','Ranbaxy','Ranbaxy Ltd','HY249Ra',547892,'Hyderabad','07/25/99'
Union select 'HCL205','HCL','HCL Tech Ltd','DL203HC',184732,'Delhi','08/10/99'
Union select 'Inf409','Infosys','Infosys Ltd','PU305IF',187934,'Pune','02/15/81'
Union select 'TCS103','TCS','Tcs Ltd','MU108TC',198463,'Mumbai','09/13/01'
Union select 'Mar408','Marico','Marico Ltd','k0103Ma',154788,'kolkata','04/15/88'
Union select 'Inc501','India cements','India cements Ltd','ch503Ic',189742,'chennai','06/18/95'
Union select 'WIP309','WIPRO','Wipro Tech Ltd','BA209WP',154386,'Bangalore','06/19/87'

alter table Security
alter column Sec_name varchar(20)


create table Scty_Tran(Scty_code varchar(10) not null,Tran_id varchar(10) not null,Trade_date date not null,Broker varchar(15),Entry_date date not null)
insert into Scty_Tran
select 'HCL205','II207','07/18/13','IIFL','07/18/13'
union select 'HDFC305','II109','07/17/13','IIFL','07/19/13'
union select 'HUL109','HD305','03/29/13','HDFC','03/29/13'
union select 'ICIC201','IC409','06/27/12','ICICI','06/27/12'
union select 'Inc501','RM308','01/15/11','Rmoney','01/16/11'
union select 'Inf409','Re107','01/05/13','Religare','01/05/13'
union select 'Mar408','HD507','07/07/09','HDFC','07/08/09'
union select 'Ran208','sk308','05/15/08','Sharekhan','05/16/08'
union select 'Tcs103','RM305','09/10/07','Rmoney','09/11/07'
union select 'WIP309','AX508','10/08/08','Axis','10/08/08'