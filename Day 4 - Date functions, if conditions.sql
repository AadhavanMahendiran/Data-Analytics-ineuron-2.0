# New functions used in this notebook
str_to_date(column name, format)
between 'date1' and 'date2'
select now()
select curdate()
select curtime() 
date_sub(now(), interval 1 week)
select year(now())
select year(date)
select year('2011-01-04')
select dayname('2023-02-27')
-- Alter table tablename
-- add column newcolumnname after columnname
alter table sales1
add column flag date after order_id
-- update tablename 
-- set existingcolumnname = condition
update sales1 
set flag = now()
-- alter table tablename
-- modify column existingcolumnname datatype;
alter table sales1
modify column Year_New int;
select year_new  , sum(sales) from sales1 group by year_new
select (sales*discount+shipping_cost)  as CTC from sales1;
# if conditions
alter table sales1
modify column discount_flag varchar(20) after discount
select order_id ,discount , if(discount > 0 ,'yes' , 'no') as discount_flag from sales1 
update sales1
set discount_flag = if(discount > 0, 'yes', 'no');

-- create database sales
use sales
-- CREATE TABLE sales01 (
-- 	order_id VARCHAR(15) NOT NULL, 
-- 	order_date VARCHAR(15) NOT NULL, 
-- 	ship_date VARCHAR(15) NOT NULL, 
-- 	ship_mode VARCHAR(14) NOT NULL, 
-- 	customer_name VARCHAR(22) NOT NULL, 
-- 	segment VARCHAR(11) NOT NULL, 
-- 	state VARCHAR(36) NOT NULL, 
-- 	country VARCHAR(32) NOT NULL, 
-- 	market VARCHAR(6) NOT NULL, 
-- 	region VARCHAR(14) NOT NULL, 
-- 	product_id VARCHAR(16) NOT NULL, 
-- 	category VARCHAR(15) NOT NULL, 
-- 	sub_category VARCHAR(11) NOT NULL, 
-- 	product_name VARCHAR(127) NOT NULL, 
-- 	sales DECIMAL(38, 0) NOT NULL, 
-- 	quantity DECIMAL(38, 0) NOT NULL, 
-- 	discount DECIMAL(38, 3) NOT NULL, 
-- 	profit DECIMAL(38, 8) NOT NULL, 
-- 	shipping_cost DECIMAL(38, 2) NOT NULL, 
-- 	order_priority VARCHAR(8) NOT NULL, 
-- 	`year` DECIMAL(38, 0) NOT NULL
-- );
-- SET SESSION sql_mode = ''
-- select * FROM SALES01;

-- Load data infile 
#'C:/Users/Admin/Desktop/sales_data_final.csv'
-- into table sales01 
-- fields terminated by ','
-- enclosed by '"'
-- lines terminated by '\n'
-- ignore 1 rows 

select * from sales1;

# TO convert the date available in string to the date time stamp 
# str_to_date(column_name, the format the date given)

select str_to_date(order_date,'%m/%d/%Y') from sales1;

# Now need to pull the above data into the table sales1 
# so we creating the new column now
alter table sales1
add column order_date_new1 date after order_date

# now updating the values into the new 
update  sales1
set order_date_new1 = str_to_date(order_date,'%m/%d/%Y')

select * from sales1;

## Now do the same operation to ship_date
alter table sales1
add column ship_date_new1 date after ship_date_new;

update sales1
set ship_date_new1 = str_to_date(ship_date,'%m/%d/%Y')

# Basics 
select * from sales1 where ship_date_new1 = '2011-01-06'; 
# between function

select * from sales1 where ship_date_new between '2011-01-04'  and '2011-03-05'
select now()
select curtime()
select curdate()
select year(date)
select year('2011-01-04')
select dayname('2023-02-27')

select * from sales1 where ship_date_new < date_sub(now(), interval 1 week)
select * from sales1 where ship_date_new < date_sub(now(), interval 30 day)
select * from sales1 where ship_date_new < date_sub(now(), interval 10 year)
select year(now())
select dayname('2023-02-27')

alter table sales1
add column flag_new date after flag;

update sales1
set flag_new = now()

# To overwrite the year column
alter table sales1
modify column year datetime;

# From date column need to create 3 columns year_new1, month_new1, day_new1
alter table sales1
add column year_new1 date

alter table sales1
add column month_new1 date

alter table sales1
add column day_new1 date

select * from sales1;

year(order_date_new)
month(order_date_new)

str_to_date(order_date_new, '%Y')
# we gave data type as date. so we did't get the result. we going to give now as 
# data type as int

alter table sales1
modify column year_new1 int

alter table sales1
modify column month_new1 int

alter table sales1
modify column day_new1 int

select year(order_date_new) from sales1;
select month(order_date_new) from sales1;
select day(order_date_new) from sales1;

update sales1 set year_new1 = year(order_date_new)
update sales1 set month_new1 = month(order_date_new)
update sales1 set day_new1 = day(order_date_new)
select * from sales1 limit 5;

select year_new1, avg(sales) from sales1 group by year_new1;
select year_new1, sum(sales) from sales1 group by year_new1;
select year_new1, max(sales) from sales1 group by year_new1;
select year_new1, sum(quantity) from sales1 group by year_new1;

# select sum(shipping_cost, discout) from sales1; ----> this is not right
select ( discount * sales + shipping_Cost) as CTC from sales1;
if discount > 0 'yes' else 'No'
select order_id, discount, if(discount > 0 ,'yes' , 'No') as discount_flag from sales1


