create database Constraints
create table Security(Scty_code varchar(10) Primary key,
Sec_name varchar(10) Not Null,
Company varchar(20) Not null,
Tin_Number varchar(12) Unique,Sedol_code int,
Head_office varchar(15) Not Null,Date_inc date check(Date_inc>'01-jan-1850'))
create table SCTY_PRICE(Sec_id varchar(10) Foreign key references security (Scty_code),Prc_date date not null,Mkt_price float not null,currency varchar(10) not null, Pricing_factor float)
alter table security
alter column Sedol_code int not null
alter table SCTY_PRICE
add constraint df_scty_price default 1 for Pricing_factor

