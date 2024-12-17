create database StudentManagementSystem;
use StudentManagementSystem;
create table students(
   student_id int
   AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR (100) NOT NULL,
   age int,
   enroliment_date date
);
alter table students change column enroliment_date
	enrollment_date date;
alter table students add column major varchar (100);
select * from students;

create table courses(
   course_id int
   AUTO_INCREMENT PRIMARY KEY,
   course_name VARCHAR (100) NOT NULL,
   credits int 
   );
 select * from courses;  
 
 create table enrollments(
   enrollment_id int 
   AUTO_INCREMENT PRIMARY KEY,
   student_id int,
   course_id int,
   semster VARCHAR(20),
   FOREIGN KEY (student_id)
   REFERENCES students(student_id),
   FOREIGN KEY (course_id)
   REFERENCES courses(course_id)
 );
select * from enrollments;

insert into students (name,age,enrollment_date, major) values
('madhu',20,'2023-09-01','computer science'),
('sai',21,'2022-12-01','mathematics'),
('raju',23,'2022-05-1','physics');

insert into courses (course_name,credits) values
('database system',3),
('data structures',4),
('operating systems',3);

insert into enrollments (student_id,course_id,semster) values
(1,1,'fall 2023'),
(1,2,'fall 2023'),
(2,1,'fall 2023'),
(3,3,'fall 2023');

select e.enrollment_id, s.name as student_name, 
   c.course_name, e.semster
from enrollments e
join students s on e.student_id = s.student_id 
join courses c on e.course_id = c.course_id; 

update students set major = 'data science', age = 21
where student_id = 1; 

delete from courses where course_id = 3;