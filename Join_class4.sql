create table student_info(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info(std_id,std_name)
values(2102043,'A'),(2102044,'B');

create table course(
course_id int not null,
std_id int,
primary key(course_id)
);
insert into course(course_id,std_id)
values(1,2102043),(2,2102044);

select *
from student_info
left join course on student_info.std_id=course.std_id;

-- Right Join

create table student_info1(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info1(std_id,std_name)
values(2102043,'A'),(2102044,'B');

create table course1(
course_id int not null,
course_name varchar(20),
std_id int,
primary key(course_id)
);
insert into course1(course_id,course_name,std_id)
values(1,'C',2102043),(2,'C++',2102044);

select *
from student_info1
right join course1 on student_info1.std_id=course1.std_id;


-- Union
create table student_info2(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info2(std_id,std_name)
values(2102043,'A'),(2102044,'B');

create table course2(
course_id int not null,
course_name varchar(20),
std_id int,
primary key(course_id)
);
insert into course2(course_id,course_name,std_id)
values(1,'C',2102043),(2,'C++',2102044);

select std_id
from student_info2
union
select std_id from course2
order by std_id; 

-- Union all
select std_id
from student_info2
union all
select std_id from course2
order by std_id; 

-- Where + Union
create table student_info4(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info4(std_id,std_name)
values(2102043,'A'),(2102044,'B'),(2102040,'C'),(2102034,'D'),(2102029,'E');

create table course4(
course_id int not null,
course_name varchar(20),
std_id int,
primary key(course_id)
);
insert into course4(course_id,course_name,std_id)
values(1,'C',2102043),(2,'C++',2102044),(3,'Java',2102040),(4,'Python',2102034),(5,'DBMS',2102029);

SELECT std_id, std_name 
FROM student_info4
WHERE std_id = 1
UNION
SELECT std_id, NULL AS std_name 
FROM course4
WHERE std_id = 1
ORDER BY std_id;

SELECT std_id, std_name 
FROM student_info4
WHERE std_id = 1
UNION all
SELECT std_id, NULL AS std_name 
FROM course4
WHERE std_id = 1
ORDER BY std_id;

-- Group By
create table student_info3(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info3(std_id,std_name)
values(2102043,'A'),(2102044,'B'),(2102040,'C'),(2102034,'D'),(2102029,'E');

create table course3(
course_id int not null,
course_name varchar(20),
std_id int,
primary key(course_id)
);
insert into course3(course_id,course_name,std_id)
values(1,'C',2102043),(2,'C++',2102044),(3,'Java',2102040),(4,'Python',2102034),(5,'DBMS',2102029);

select count(std_id)
from student_info3
group by std_name;


select count(std_id),std_name
from student_info3
group by std_name
order by count(std_id) desc;

-- Group By in Join
create table student_info5(
std_id int not null,
std_name varchar(20),
primary key(std_id)
);
insert into student_info5(std_id,std_name)
values(2102043,'A'),(2102044,'B'),(2102040,'C'),(2102034,'D'),(2102029,'E');

create table course5(
course_id int not null,
course_name varchar(20),
std_id int,
primary key(course_id)
);
insert into course5(course_id,course_name,std_id)
values(1,'C',2102043),(2,'C++',2102044),(3,'Java',2102040),(4,'Python',2102034),(5,'DBMS',2102029);

select student_info5.std_name,
count(course5.course_id) from course5
left join student_info5 on
student_info5.std_id=course5.std_id
group by std_name;

-- Time, date
create table student_info6(
std_id int not null,
std_name varchar(20),
graduated_date date,
primary key(std_id)
);
insert into student_info6(std_id,std_name,graduated_date)
values(2102043,'A','2026-11-11'),(2102044,'B','2024-05-30'),(2102040,'C','2020-01-31'),(2102034,'D','2022-12-07'),
(2102029,'E','2024-01-25');

select * from student_info6
where graduated_date>'2024-01-01';

-- Date time
create table student_info7(
std_id int not null,
std_name varchar(20),
graduated_date datetime,
primary key(std_id)
);
insert into student_info7(std_id,std_name,graduated_date)
values(2102043,'A','2026-11-11 1:20:00'),(2102044,'B','2024-05-30 2:30:12'),(2102040,'C','2020-01-31 05:20:00'),
(2102034,'D','2022-12-07 06:12:55'),
(2102029,'E','2024-01-25 12:12:12');

select * from student_info6
where graduated_date>'2024-01-01 05:00:00';




