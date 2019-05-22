create database company
create table department(deptid int, dname varchar(20),location varchar(20))
create table employee(empid int, ename varchar(20), dob date, salary float, designation varchar(20),manager varchar(20),mgrid int, deptid int, dname varchar(20))
alter table department
add dept_head varchar(15)

alter table employee
alter column mgrid varchar(15)

drop table employee
drop column mgrid

truncate table employee

--drop will delete the entire table
--truncate will delete only the data.
