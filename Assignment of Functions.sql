use sys;

CREATE TABLE Student_Performance (
student_id INT PRIMARY KEY,
name VARCHAR(50),
course VARCHAR(30),
score INT,
attendance INT,
mentor VARCHAR(50),
join_date DATE,
city VARCHAR(50));

select * from student_performance;

INSERT INTO Student_Performance
(student_id, name, course, score, attendance, mentor,
join_date, city)
VALUES
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma',
'2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma',
'2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair',
'2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr.
Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair',
'2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer',
'2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor',
'2023-06-15', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor',
'2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma',
'2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer',
'2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair',
'2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor',
'2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer',
'2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma',
'2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair',
'2023-07-12', 'Hyderabad');


## Answer 1


select Student_id, Name, Course, Score,
rank() over(order by score desc) Rank_ 
from student_performance;



## Answer 2


select Student_id, Name, Course, Score,
lag(score) over(order by score desc) Previous_score
from student_performance;



## Answer 3


select Student_id, upper(Name), Course, score, monthname(join_date) Month_name from student_performance;



## Answer 4


select Student_id, Name, course, Attendance,
lead(attendance) over(order by attendance desc) next_student_attendance 
from student_performance;



## Answer 5


select Student_id, Name, Score,
ntile(4) over(order by score desc) performance_groups
from student_performance;



## Answer 6


select row_number() over(partition by course order by attendance desc) Row_no,
 Student_id, Name, Course, Attendance 
 from student_performance;
 
 
 
## Answer 7


select Student_id, Name, Course, join_date,
datediff("2025-01-01", join_date) No_of_days from student_performance;  



## Answer 8


select student_id, Name, Course, 
date_format(join_date, "%M %Y") Join_date from student_performance;



## Answer 9


select Student_id, Name, Course,
replace(city, "Mumbai", "MUM") City_ 
from student_performance;



## Answer 10


select Student_id, Name, Course, Score,
first_value(score) over(partition by course
order by score desc) highest_score from student_performance;