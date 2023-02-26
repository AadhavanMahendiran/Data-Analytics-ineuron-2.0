show databases;
 use ineuron_fsda;
 select * from bank_details;
 
 select count(*) from bank_details;
 
 select loan, age, job from bank_details;
 select `default` from bank_details;
 select * from bank_details limit 10;
 select * from bank_details where age = 33;
select * from bank_details where age = 60 and job = 'entreprenuer'
select * from bank_details where education = 'unknown' and job = 'retired';

# we can apply both and or in the same command
select * from bank_details where (education = 'unknown' or marital = 'single' ) and balance < 500;
select distinct job from bank_details;

select * from bank_details order by age asc;
select * from bank_details order by age desc;
select avg(balance) from bank_details;
select * from bank_details where balance = min(balance);
select min(balance) from bank_details;
 select * from bank_details where balance = (select min(balance) from bank_details)
 select * from bank_details where balance in (select min(balance) from bank_details)
  select * from bank_details where loan = 'yes';
select avg(balance) from bank_details where job = 'admin';
select * from bank_details where age < 45;
select * from bank_details where education = 'primary' and job = 'unknown';
select * from bank_details where balance < 0;
select balance, housing from bank_details where housing = 'no';