# you can check the execqution time of the query in query statistics

################################# Stored procedure #########################################
Here we write the code one time and use it again and again million times.

DELIMITER &&
create procedure sudh()
BEGIN 
		select * from bank_details;
END &&

call sudh()

DELIMITER &&
create procedure bal_max()
BEGIN
	select * from bank_details where balance in (select max(balance) from bank_details);
END &&

call bal_max();

# you can call this procedure even in new sql file.

DELIMITER &&
# here inside the avg_bal_basedon_jobrole() 'IN' means input, var = variable name it can be any name 
# even it can be 'aadhavan', 'king' then last give the datatype
create procedure avg_bal_basedon_jobrole1(IN var varchar(30))
BEGIN
	select * from bank_details where job = var;
END &&

call avg_bal_basedon_jobrole1('unknown');

DELIMITER &&
create procedure sel_edu_job(IN v1 varchar(30), IN v2 varchar(30))
BEGIN
	select * from bank_details where education = v1 and job = v2;
END &&

call sel_edu_job('tertiary' , 'retired')
call sel_edu_job('primary' , 'retired')

##################### Views #########################################

When we call the table completely the complexity of the data is getting increased
SO we going to create the view where we can store the subset of the data

create view banking_view as select age, job, marital, balance, education from bank_details;
##################### This banking_view is the table we created from bank_details; ##################
select avg(balance) from banking_view where job = 'admin.';
