Select * from Security full join SCTY_PRICE on Scty_code=Sec_id

select * from Security inner join SCTY_PRICE on Scty_code=Sec_id

select * from Security left join SCTY_PRICE on Scty_code=Sec_id

select * from Security right join SCTY_PRICE on Scty_code=Sec_id

Select * from Scty_Tran

update Scty_Tran
set Scty_code = 'Rem102'
where Tran_id = 'Re107'

Update Scty_Tran
set Scty_code = 'PRT109'
Where Tran_id = 'HD507'

update Scty_Tran
set Scty_code = 'IGS205'
where Tran_id = 'sk308'

Select * from Security as S full join Scty_Tran as St on S.Scty_code=St.Scty_code

Select * from Security as S inner join Scty_Tran as St on S.Scty_code=St.Scty_code

Select * from Security as S left join Scty_Tran as St on S.Scty_code=St.Scty_code

Select * from Security as S right join Scty_Tran as St on S.Scty_code=St.Scty_code

--full join with condition

Select * from Security as S full join Scty_Tran as St on S.Scty_code = St.Scty_code where S.Scty_code is null or St.Scty_code is null

--SQL Joins class assignement

--1.Find out security code,company,market price,pricing factor
 --for those records for which sedol code is 184732 and 543917.

Select Scty_code,company,Mkt_price,pricing_factor from Security inner join SCTY_PRICE on Scty_code = Sec_id where Sedol_code in(184732,543917)

--2.Find out scty_code ,tin number,transaction id and entry date for 
--which trade date ranges from jan 1,2013 to dec 31,2013 and broker starts with 'i'.

Select s.Scty_code,Tin_number,Tran_id,Entry_date from Security as s
inner join Scty_Tran as st
on s.Scty_code=st.Scty_code 
where Trade_date between '1-jan-2013' and '31-dec-2013' and Broker like 'i%'

--3.Find out security code,mkt_price,sedol_code, pricing_factor, tran_id and trade date for 
--which pricing_factor is less than 100 and Entry_date ranges from jan 1,2009 to jul 31,2013.

select s.Scty_code,Mkt_price,sedol_code, pricing_factor, tran_id, trade_date from Security as s
inner join Scty_Tran as st
on s.Scty_code = st.Scty_code
inner join SCTY_PRICE as sp
on st.Scty_code=sp.Sec_id
where pricing_factor>100 and Entry_date between '1-jan-2009' and '31-jul-2013'
