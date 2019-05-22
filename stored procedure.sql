alter procedure usp_mathll
(@a int, @b int)
as 
begin
declare @add int, @sub int,@mul int, @div int
set @add = @a+@b
set @sub = @a-@b
set @mul = @a*@b
set @div = @a/@b
print 'addition ='+cast(@add as varchar(10))
print 'subtraction ='+cast(@sub as varchar(10))
print 'multiply ='+cast(@mul as varchar(10))
print 'division ='+cast(@div as varchar(10))
end

exec usp_mathll 40,20


alter procedure operation
(@a int, @b int,@op varchar(5))
as 
begin
declare @add float,@sub float,@mul float,@div float
if @op='+'
begin
set @add=@a+@b
print 'addition ='+cast(@add as varchar(10))
end
else if @op='-'
begin
set @sub=@a-@b
print 'subtraction ='+cast(@sub as varchar(10))
end
else if @op='*'
begin
set @mul=@a*@b
print 'multiplication ='+cast(@mul as varchar(10))
end
else if @op='/'
begin
set @div=@a/@b
print 'division ='+cast(@div as varchar(10))
end
else
print 'invalid'
end

exec operation 20,10,'/'
exec operation 20,10,'?'

---Question 3 - create a stored procedure to create email ids by using first name dot first 3
--characters of last name @nikhilanalytics.com.
--for eg. if first name is mohit and last name is bishnoi then email id gentrated will be mohit.bis@nikhilanalytics.com
--first name, last name and email every time should be stored in email_contact table
create table emailid(fname varchar(10),lname varchar(10),emailid varchar(35))
create procedure usp_emailid
(@fname varchar(10), @lname varchar(10))
as 
begin
declare @emailid varchar(35)
set @emailid = @fname+'.'+SUBSTRING(@lname,1,3)+'@nikhilanalytics.com'
--set @emailid = @fname+'.'+SUBSTRING(@lname,1,3)+'@nikhilanalytics.com'
print @emailid

insert into emailid
select @fname,@lname,@emailid
select * from emailid
end

exec usp_emailid 'soni','choubay'
exec usp_emailid 'Mohit','Bishnoi'

select * from emailid


--question --
--write stored procedure to find even number and their count in between 2 given number

create procedure even_no
(@a int,@b int)
as
begin
declare @count int
set @count=0
set @a=@a+1
while(@a<@b)
begin
if(@a%2)=0
begin
set @count=@count+1
print 'result='+cast(@a as varchar(10))
end
set @a=@a+1
end 
print 'count='+cast(@count as varchar(10))
end

exec even_no 1,10