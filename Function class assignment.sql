select * from scty_price

select SUM(Mkt_price), AVG(Mkt_price) from SCTY_PRICE

select COUNT(*) from Scty_Tran

select Mkt_price,Mkt_price*1.1 as inc_market_price from SCTY_PRICE

select Trade_date, DATEADD(DAY,2,Trade_date) as settlement_date from Scty_Tran


select Trade_Date, Entry_date, DATEDIFF(Day,Trade_date,Entry_date) from Scty_Tran

select DATEDIFF(year,'1947-07-15',getdate())

select day(Prc_date) as days, MONTH(Prc_date) as Months from SCTY_PRICE

select order_date, DATEadd(MONTH,-6,order_date) as six_month_back from customer

select * from Security

select upper(SUBSTRING(Scty_code,1,3) + right(Tin_Number,2)) from Security

select * from Scty_Tran

select Trade_date,Entry_date from Scty_Tran where Trade_date = Entry_date







