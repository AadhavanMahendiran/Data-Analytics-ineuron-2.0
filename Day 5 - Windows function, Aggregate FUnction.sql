delimiter &&
create procedure king()
Begin &&
	select * from sales1
End &&

## Windows function
show databases;
create database windows_function
use windows_function

create table ineuron_students(
student_id int ,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
students_marks int ,
student_mail_id varchar(50))

insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com')

select * from ineuron_students;

# Performing Aggregate functions along with group by

select student_batch, sum(students_marks) from ineuron_students 
group by student_batch;
select student_batch, min(students_marks) from ineuron_students 
group by student_batch;
select student_batch, max(students_marks) from ineuron_students 
group by student_batch;
select student_batch, avg(students_marks) from ineuron_students 
group by student_batch;
select count(student_batch) from ineuron_students;
select count(distinct student_batch) from ineuron_students;

select student_batch, count(*) from ineuron_students group by student_batch;

select * from ineuron_students;
select max(students_marks) from ineuron_students where student_batch = 'fsda';
select student_batch, student_name, max(students_marks) from ineuron_students 
group by student_batch

select student_name from ineuron_students where students_marks in 
(select max(students_marks) from ineuron_students where student_batch = 'fsda')

# This 'Limit' will give you the output till that number. 
# Eg : 'limit 3' - Here it will give output till 3rd row

select student_name from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 3

# In this below case. where 'limit 1,2'
# giving the output as 2 rows after the 1st row
# like for 'limit 2,3' the ouptput will be 3 rows after the 2nd row

select student_name from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 1,2

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 1,3

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 2,1

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 3,1

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 4,1

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 3,2

select * from ineuron_students where student_batch = 'fsda'
order by students_marks desc limit 1,3
-------------------------------------------------------------------

select min(students_marks) from (select 
 students_marks from ineuron_students
 where student_batch = 'fsda'
 order by students_marks desc limit 3) as test;
 
 select * from ineuron_students where 
 students_marks = (select min(students_marks) from (select 
 students_marks from ineuron_students
 where student_batch = 'fsda'
 order by students_marks desc limit 3) as top)
 
 
 # given 'top' alias . because all the query table need to have alias 
 # Windowing function
1. Rank()
2. Dense_rank()
3. Row_number()

 # when using only order by inside the over() you will get multiple window
 select * from ineuron_students
 select student_id, student_batch, student_stream, 
 students_marks, row_number() over(order by students_marks) as 'row_number'
 from ineuron_students

 # when you use partition by you number of windows
 select student_id, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks) as 'row_number'
 from ineuron_students
 
 # Now we need in all student batch we need row_num = 1
 select * from (select student_id, student_name, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks) as 'row_num'
 from ineuron_students) as test where  row_num = 1;
 
 select student_id, student_name, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks) as 'row_number'
 from ineuron_students group by student_batch; 
 
 select student_id, student_name, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks desc) as 'row_number'
 from ineuron_students;
 
 select * from (select student_id, student_name, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks desc) as 'row_num'
 from ineuron_students) as test where row_num = 1;
 # even the above is not the correct one
 # Let we insert 1 new record 
 insert into ineuron_students values
 (119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com')
 
 # Now excecute the same query
 select student_id, student_name, student_batch, student_stream, 
 students_marks, row_number() over(partition by student_batch 
 order by students_marks desc) as 'row_number'
 from ineuron_students;
 # The windowing function just a seperation it will create the bucket
 # partition by will try to create the window
 # Now we have 2 record person get high marks in 'fsdc'.
# is we try to getr the highest marks with row_num  = 1. 
# we dont get the second record

Rank()

 select student_id, student_name, student_batch, student_stream, 
 students_marks, rank() over( 
 order by students_marks desc) as 'row_rank'
 from ineuron_students;
# In the above rank if we have 2 rows with Rank 1 then we dont have Rank2
--  select student_id, student_name, student_batch, student_stream, 
--  students_marks, rank() over(partition by student_batch 
--  order by students_marks desc) as 'row_number'
--  from ineuron_students;
 
 select student_id, student_name, student_batch, student_stream, 
 students_marks, 
  row_number() over( order by students_marks desc) as 'row_num',
 rank() over( 
 order by students_marks desc) as 'row_rank'
 from ineuron_students;
 
 # With partition window 
 select student_id, student_name, student_batch, student_stream, 
 students_marks, 
 row_number() over(partition by student_batch order by students_marks desc) as 'row_num',
 rank() over( partition by student_batch
 order by students_marks desc) as 'row_rank'
 from ineuron_students;
 
 # to get tha all highest marks based on the batch
 select * from (select student_id, student_name, student_batch, student_stream, 
 students_marks, 
 row_number() over(partition by student_batch order by students_marks desc) as 'row_num',
 rank() over( partition by student_batch
 order by students_marks desc) as 'row_rank'
 from ineuron_students) as test where row_rank = 1;

dense_rank()

 select student_id, student_name, student_batch, student_stream, 
 students_marks, 
 row_number() over(partition by student_batch order by students_marks desc) as 'row_num',
  rank() over( partition by student_batch
 order by students_marks desc) as 'row_rank',
 dense_rank() over( partition by student_batch
 order by students_marks desc) as 'dense_rank'
 from ineuron_students;
 
 select * from (select student_id, student_name, student_batch, student_stream, 
 students_marks, 
 row_number() over(partition by student_batch order by students_marks desc) as 'row_num',
 rank() over( partition by student_batch
 order by students_marks desc) as 'row_rank',
 dense_rank() over( partition by student_batch
 order by students_marks desc) as 'dense_rank'
 from ineuron_students) as `dense_rank` where `dense_rank` = 2;