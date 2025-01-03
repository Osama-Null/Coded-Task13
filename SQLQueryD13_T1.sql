create database Task13
go
use Task13
go
create schema CodedT13
go
create table CodedT13.Student(
	StudentID int primary key identity(1, 1) not null,
	--------------------------------------------------
	StudentName nvarchar(50),
	Age int,
	Email nvarchar(100)
)
go
create table CodedT13.Courses(
	CourseID int primary key identity(1, 1) not null, 
	-------------------------------------------------
	CourseName nvarchar(50),
	StID int
)
go -- Q2
insert into CodedT13.Student values('Vlad', 23, 'vl@pm.ru'),
								   ('Asya', 23, 'as@pm.ru'),
								   ('Alina', 30, 'al@pm.ru')
go -- Q3
insert into CodedT13.Courses values('History', 1),
								   ('Physics', 1),
								   ('Chemistry', 2),
								   ('Russian', 2),
								   ('Arabic', 3)
go -- Q4
select StudentName, CourseName from CodedT13.Student as s join CodedT13.Courses as c on s.StudentID = c.StID
go -- Q5
update CodedT13.Student set Email= 'vd@pm.ru' where StudentID = 1
go -- Q6
delete c from CodedT13.Courses as c join CodedT13.Student as s
on c.StID = s.StudentID where s.StudentID = 2
go -- Q7
alter table CodedT13.Student add Gender nvarchar(50)
go -- Q8
update CodedT13.Student set Gender = 'Male' where StudentID = 1
update CodedT13.Student set Gender = 'Female' where StudentID between 2 and 3
go -- Q9
select s.StudentName, COUNT(c.CourseID) from CodedT13.Student as s left join CodedT13.Courses as c on s.StudentID = c.StID group by s.StudentName;
go -- Q10
select * from CodedT13.Student where StudentName like 'M%'
go -- Q11
select UPPER(StudentName) from CodedT13.Student
go -- Q12
select LOWER(StudentName) from CodedT13.Student
go -- Q15
select s.StudentID		as 'ID',
	   s.StudentName	as 'Name',
	   s.Email          as 'Email',
	   s.Age            as 'Age',
	   s.Gender         as 'Gender',
	   c.CourseID		as 'Course ID', 
	   c.CourseName		as 'Course Name'
from CodedT13.Student as s join CodedT13.Courses as c
on s.StudentID = c.StID
go -- Q16
insert into CodedT13.Student values('Sam', 24, 'o@pm.kw'),
								   ('Vi', 20, 'v@pm.ru')

insert into CodedT13.Courses values('Sport', 5),
								   ('Physics', 4)
go -- Q17
select StudentName as 'Name', Age from CodedT13.Student where Age = (select min(Age) from CodedT13.Student)
go -- Q20
select CourseName from CodedT13.Courses order by CourseName asc
go -- Q21
create proc PrintNameNCourse as (
	select StudentName, CourseName from CodedT13.Student as s join CodedT13.Courses as c on s.StudentID = c.StID
) 
exec PrintNameNCourse
go -- Q22
create proc PrintNameNCourseById as (
	select StudentName, CourseName from CodedT13.Student as s join CodedT13.Courses as c on s.StudentID = c.StID
) 
exec PrintNameNCourse

select * from CodedT13.Courses
select * from CodedT13.Student