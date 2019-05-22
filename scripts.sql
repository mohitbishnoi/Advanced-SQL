--script
--declare local variable if required
--assign values to local variable if required
--write genralized query or code using local varibale

create table add_info
(x float not null,y float not null,add_result float not null)

--scripts start from here
declare @a float,@b float,@add float

set @a=10
set @b=20
set @add=@a+@b

insert into add_info(x,y,add_result)
select @a,@b,@add

select * from add_info
--where X=@a and Y=@b

print 'first number is '+cast(@a as varchar(10))
print 'second number is '+cast(@b as varchar(10))
print 'Result is '+cast(@add as varchar(10))

--assingment questions 11

declare @n float,@y float

set @n=20
set @y = (@n*(@n+1)*(2*@n+1))/6

print 'sum of square of 20 number is '+cast(@y as varchar(50))



--assingment questions 12

declare @m varchar(10),@q varchar(10),@r varchar(10)

set @m=LOWER('NIKHIL')
set @q = '&'
set @r = UPPER('aNalytics')

print 'Concatination of string is: '+@m+' '+@q+' '+@r 


