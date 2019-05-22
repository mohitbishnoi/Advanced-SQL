create table emp_test
(emp_id int not null,
ename varchar(20) not null,
salary float not null)

create table emp_audit
(emp_id int not null,
e_name varchar(20) not null,
salary float not null,
user_name varchar(30) not null,
audit_action varchar(100) not null,
time_stamp datetime not null)

select * from emp_test

select * from emp_audit

create table salary_info
(emp_id varchar(10) not null,
designation varchar(30) not null,
salary float not null)

insert into salary_info values
('AE2011','CEO',2500000),
('AE2012','PRESIDENT',2250000),
('AE2013','VP',2000000),
('AE2014','SSE',7000000),
('AE2015','BUSINESS ANALYST',8500000),
('AE2016','SE',3000000),
('AE2017','ANALYST',4500000),
('AE2018','ASSOCIATE',1900000)

SELECT SUSER_NAME()
SELECT GETDATE()


--trigger starts here

create trigger trg_emp_test_after_insert
on emp_test
after insert
as
declare @eid int, @name varchar(20),@sal float,@audit varchar(100)

select @eid = i.emp_id from inserted as i
select @name = i.ename from inserted as i
select @sal = i.salary from inserted as i

set @audit  = SUSER_NAME() + 'has inserted records at: '+
				CAST(getdate() as varchar(30))
				
insert into emp_audit(emp_id, e_name,salary,user_name,audit_action,time_stamp)
select @eid,@name,@sal,SUSER_NAME(),@audit,GETDATE()

--trigger ends here

insert into emp_test
select 101,'Rajesh',40000

--create an instead of triggers on any table. if some one 
--tries to insert any record in the table, trigger should fire
--a code to which will print "you are not allowed to insert records".

create trigger insert_not_allowed
on emp_test
instead of insert
as
print 'you are not allowed to insert records'

drop trigger insert_not_allowed
				
								
insert into emp_test
select 101,'Mohit',40000

