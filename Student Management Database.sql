/* Task 1 */
create table students (
student_id INT primary key,
name varchar(50),
gender char(1),
age INT,
grade varchar(2),
mathscore INT,
sciencescore INT,
englishscore INT
);

INSERT INTO students (student_id, name, gender, age, grade, mathscore, sciencescore, englishscore) VALUES
(1, 'Raj Patel', 'M', 15, 'A', 88, 91, 85),
(2, 'Nikul Parmar', 'M', 14, 'A', 92, 89, 90),
(3, 'Ram Kumar', 'M', 16, 'B', 76, 81, 74),
(4, 'Shivanu Mangrulkar', 'F', 15, 'A', 90, 93, 88),
(5, 'Mohit Mehta', 'M', 14, 'C', 65, 68, 70),
(6, 'Muskan Rathod', 'F', 15, 'B', 78, 82, 80),
(7, 'Arjun Rathod', 'M', 16, 'B', 81, 79, 77),
(8, 'Khushi Parmar', 'F', 14, 'A', 95, 94, 92),
(9, 'Rohan Verma', 'M', 15, 'C', 69, 72, 68),
(10, 'Pooja Sharma', 'F', 16, 'B', 84, 86, 83),
(11, 'Aditya Nair', 'M', 15, 'A', 91, 88, 89),
(12, 'Babita Iyer', 'F', 14, 'A', 89, 92, 90),
(13, 'Manav Gupta', 'M', 16, 'C', 62, 65, 67),
(14, 'Neha Choudhary', 'F', 15, 'B', 80, 78, 82),
(15, 'Kunal Singh', 'M', 14, 'B', 83, 85, 81),
(16, 'Aditi Mishra', 'F', 16, 'A', 94, 90, 93),
(17, 'Rahul Bansal', 'M', 15, 'C', 70, 73, 69),
(18, 'Meera Kapoor', 'F', 14, 'A', 88, 91, 87),
(19, 'Sahil Khanna', 'M', 16, 'B', 79, 82, 78),
(20, 'Nidhi Agarwal', 'F', 15, 'A', 93, 95, 91);

INSERT INTO students VALUES
-- Normal score studen
(21, 'Rahul Mehta', 'M', 16, 'B', 72, 68, 75),
(22, 'Priya Sharma', 'F', 15, 'A', 85, 88, 82),
(23, 'Amit Verma', 'M', 17, 'C', 55, 60, 58),
(24, 'Sneha Iyer', 'F', 16, 'B', 70, 73, 69),
(25, 'Karan Patel', 'M', 15, 'D', 40, 45, 42),
(26, 'Anjali Rao', 'F', 16, 'A', 89, 86, 90),
(27, 'Vikas Singh', 'M', 17, 'C', 62, 59, 61),
(28, 'Neha Gupta', 'F', 15, 'B', 74, 77, 72),
(29, 'Rohit Malhotra', 'M', 16, 'C', 50, 54, 52),
(30, 'Pooja Nair', 'F', 17, 'A', 88, 84, 86),

(31, 'Arjun Reddy', 'M', 16, 'B', 76, 73, 78),
(32, 'Kavya Joshi', 'F', 15, 'C', 65, 63, 67),
(33, 'Manish Kumar', 'M', 15, 'C', 58, 60, 55),
(34, 'Isha Malviya', 'F', 16, 'B', 71, 74, 70),
(35, 'Nitin Bansal', 'M', 16, 'C', 64, 66, 62),
(36, 'Shreya Sen', 'F', 17, 'A', 87, 85, 88),
(37, 'Varun Arora', 'M', 16, 'B', 73, 71, 75),
(38, 'Meenal Jain', 'F', 15, 'C', 69, 67, 70),
(39, 'Tanvi Deshpande', 'F', 16, 'A', 84, 86, 82),
(40, 'Naina Kapoor', 'F', 16, 'B', 78, 80, 76),
(41, 'Sahil Khan', 'M', 17, 'F', 35, 38, 36),
(42, 'Deepak Yadav', 'M', 17, 'F', 32, 34, 30),
(43, 'Abhishek Mishra', 'M', 17, 'F', 33, 36, 39),
(44, 'Mohit Saxena', 'M', 17, 'F', 28, 35, 31),
(45, 'Yash Thakur', 'M', 16, 'F', 37, 39, 34),
(46, 'Suresh Pillai', 'M', 15, 'F', 30, 33, 35),
(47, 'Pallavi Ghosh', 'F', 15, 'F', 34, 36, 32),
(48, 'Riya Chatterjee', 'F', 16, 'F', 29, 31, 34),
(49, 'Ankita Roy', 'F', 17, 'F', 38, 36, 39),
(50, 'Aarti Kulkarni', 'F', 15, 'F', 27, 29, 35);

/* Show all details */
select * from students
/* to find all the details from the table we will simply use "*" to get all the results */


/* Average score in each subject */
select round(avg(mathscore), 2) as avg_math, round(avg(sciencescore), 2) as avg_science, round(avg(englishscore), 2) as avg_english
from students
/* To find the average score of student in each subject we have used "avg" aggregate function we have also used "round" function
to get the results with decimal value up to 2 decimals */
/* with the results we found that student's best performance came in science followed by math and english, though there is
 big difference between the average results of all the 3 subjects */


/* Top performer */
with best_student as (select student_id, name, gender, sum(mathscore + sciencescore + englishscore) as total_score from students
group by student_id, name)
select  Row_number() over (order by total_score desc) as best_student, student_id, name, gender, total_score from best_student
/* To get the results for the top performer we have used "row_number" function to get the ranking of students as per the total number
of marks scored from the summation of all the 3 subjects, we have also used Cte here to create a temporary table for total score from 
all the 3 subjects */
/* with the results we found that female gender has performed well, we also get an insight that the top 13 performers have scored
marks more than 80% and top 10 have scored more than 250 marks out of 300 */


/* Count students per grade */
select  grade , count(student_id) from students
group by grade
order by grade asc
/* to get the results for the grade count, we have used "count" aggregate function */
/* from the results we can see that 30% of students have scored grade A, only 4 student have scored grade C */


/* Average score by gender */
with gender_score as (select student_id, gender, sum(mathscore + sciencescore + englishscore) as total_score from students
group by student_id, gender)
select gender, round(avg(total_score), 2) from gender_score
group by gender
/* to get the results for average score by gender we have again used the Cte to create a temporary table where we can the total score
from all the subjects, after that we have used "avg" aggregate function to get the final result with 2 decimal place using "round" function
notice that we also need to select the primary key here to get the optimal results */
/* from the results we found that females average score is more compare to males, which we were also able to find in our one of the
previous insights where, top 5 student with best score were females */


/* Students with mathscore > 80 */
select student_ID, name, mathscore from students
where mathscore > 80
/* to get the results for maths score greater than 80 we have used where function to find the score of maths which is more than 80 */
/* from the insight we found that 12 students have scored more than 80 in Math */


/* update the grades of students */
update students 
set grade = case 
when (mathscore + sciencescore + englishscore)/3 >= 90 then 'A'
when (mathscore + sciencescore + englishscore)/3 >= 75 then 'B'
when (mathscore + sciencescore + englishscore)/3 >= 60 then 'C'
when (mathscore + sciencescore + englishscore)/3 >= 40 then 'D'
else 'F'
end
/* to update the grade of students, we have used to update function along with case when function to group the gardes as per the 
marks scored */

/* ----------------------------------------------------------------------------------------------------------------------------*/

/* Task 2 */

/* In the next task we are creating 2 new tables with the existing data that we have, the 2 new tables are "courses" and 
"enrollments" */

create table courses (
course_id int primary key,
course_name varchar(50))

insert into courses (course_id, course_name) values
(1, 'math'),
(2, 'science'),
(3, 'english')

/* Created a new table and inserted values with the course_id to the given table */

create table enrollments
(student_id int, 
course_id int, 
grade varchar(2))

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'B'), (1, 2, 'A'), (1, 3, 'B'),
(2, 1, 'B'), (2, 2, 'A'), (2, 3, 'A'),
(3, 1, 'C'), (3, 2, 'B'), (3, 3, 'C'),
(4, 1, 'A'), (4, 2, 'A'), (4, 3, 'B'),
(5, 1, 'D'), (5, 2, 'D'), (5, 3, 'C'),
(6, 1, 'C'), (6, 2, 'B'), (6, 3, 'B'),
(7, 1, 'B'), (7, 2, 'C'), (7, 3, 'C'),
(8, 1, 'A'), (8, 2, 'A'), (8, 3, 'A'),
(9, 1, 'D'), (9, 2, 'C'), (9, 3, 'D'),
(10, 1, 'B'), (10, 2, 'B'), (10, 3, 'B'),
(11, 1, 'A'), (11, 2, 'B'), (11, 3, 'B'),
(12, 1, 'B'), (12, 2, 'A'), (12, 3, 'A'),
(13, 1, 'D'), (13, 2, 'D'), (13, 3, 'D'),
(14, 1, 'B'), (14, 2, 'C'), (14, 3, 'B'),
(15, 1, 'B'), (15, 2, 'B'), (15, 3, 'B'),
(16, 1, 'A'), (16, 2, 'A'), (16, 3, 'A'),
(17, 1, 'C'), (17, 2, 'C'), (17, 3, 'D'),
(18, 1, 'B'), (18, 2, 'B'), (18, 3, 'B'),
(19, 1, 'C'), (19, 2, 'B'), (19, 3, 'C'),
(20, 1, 'A'), (20, 2, 'A'), (20, 3, 'A');

INSERT INTO enrollments VALUES
-- High / average performers
(21, 1, 'B'), (21, 2, 'B'), (21, 3, 'B'),
(22, 1, 'A'), (22, 2, 'A'), (22, 3, 'A'),
(23, 1, 'C'), (23, 2, 'C'), (23, 3, 'C'),
(24, 1, 'B'), (24, 2, 'B'), (24, 3, 'B'),
(25, 1, 'D'), (25, 2, 'D'), (25, 3, 'D'),
(26, 1, 'A'), (26, 2, 'A'), (26, 3, 'A'),
(27, 1, 'C'), (27, 2, 'C'), (27, 3, 'C'),
(28, 1, 'B'), (28, 2, 'B'), (28, 3, 'B'),
(29, 1, 'C'), (29, 2, 'C'), (29, 3, 'C'),
(30, 1, 'A'), (30, 2, 'A'), (30, 3, 'A'),

(31, 1, 'B'), (31, 2, 'B'), (31, 3, 'B'),
(32, 1, 'C'), (32, 2, 'C'), (32, 3, 'C'),
(33, 1, 'C'), (33, 2, 'C'), (33, 3, 'C'),
(34, 1, 'B'), (34, 2, 'B'), (34, 3, 'B'),
(35, 1, 'C'), (35, 2, 'C'), (35, 3, 'C'),
(36, 1, 'A'), (36, 2, 'A'), (36, 3, 'A'),
(37, 1, 'B'), (37, 2, 'B'), (37, 3, 'B'),
(38, 1, 'C'), (38, 2, 'C'), (38, 3, 'C'),
(39, 1, 'A'), (39, 2, 'A'), (39, 3, 'A'),
(40, 1, 'B'), (40, 2, 'B'), (40, 3, 'B'),

-- Low score students (matching <40 marks → grade F)
(41, 1, 'F'), (41, 2, 'F'), (41, 3, 'F'),
(42, 1, 'F'), (42, 2, 'F'), (42, 3, 'F'),
(43, 1, 'F'), (43, 2, 'F'), (43, 3, 'F'),
(44, 1, 'F'), (44, 2, 'F'), (44, 3, 'F'),
(45, 1, 'F'), (45, 2, 'F'), (45, 3, 'F'),
(46, 1, 'F'), (46, 2, 'F'), (46, 3, 'F'),
(47, 1, 'F'), (47, 2, 'F'), (47, 3, 'F'),
(48, 1, 'F'), (48, 2, 'F'), (48, 3, 'F'),
(49, 1, 'F'), (49, 2, 'F'), (49, 3, 'F'),
(50, 1, 'F'), (50, 2, 'F'), (50, 3, 'F');

/* With the enrollments table, used the reference of the students table and added the required values for 
each student and each course */

/* List all students enrolled in each course. */

select en.student_id, st.name, en.course_id, cr.course_name from enrollments en
join students st on st.student_id = en.student_id
join courses cr on cr.course_id = en.course_id
order by course_id asc

/* Used join function here to get the required data, where we joined all the 3 tables to get the data */

/* Find average grade per course. */

with average_grades as (select sum(mathscore + sciencescore + englishscore)/3 as average_score, student_id, name from students 
group by student_id, name)
select student_id, name, case when average_score >= 90 then 'A' when average_score >= 75 then 'B'
when average_score >= 60 then 'C' when average_score >= 40 then 'D' when average_score < 40 then 'F'end as average_grade 
from average_grades
order by student_id asc

/* I first created a temporary table using CTE for average score using the subjectscore, where used the sum function and divided
the values by 3 to get the average score, then we using the case when statements in the main query, assigned the grades to the 
score and the list was ordered by ascending order */

/* Find top 3 students overall. */

with top_students as (select sum(mathscore + sciencescore + englishscore) as total_score, student_id, name from students 
group by student_id, name)
select student_id, name, total_score from top_students
order by top_students desc
limit 3

/* For this I created a temporary table useing CTE to get the total score of all the 3 subjects, then wrote the main query where
top score was ordered by descending order to get the top scores on the top and then used "limit 3" to get the top 3 results */

/* Count students who failed (grade < 40). */

with average_scores as (select sum(mathscore + sciencescore + englishscore)/3 as average_score, student_id, name from students 
group by student_id, name) 
select student_id, name, count(average_score) from average_scores
group by student_id, name, average_score

union all 

select NULL AS student_id, 'total_failed' AS name, count(average_score) as total from average_scores
where average_score < 40
order by student_id asc

/* For this again used the same CTE which was used earlier this time the subject was changed to average score as this time the 
scores were required, using this wrote the main query, where "count" function was used to count the average_score, then used 
the "union all" function to add the total_failed row at the end with giving condition of average_score < 40 using "Where function" */
/* Through this we found the result that no students have failed. */

/* ----------------------------------------------------------------------------------------------------------------------------*/

/* Task 3 */

/* Top student per course. */

select  student_id, name, 'Math' as subject, mathscore as max_score from students
where mathscore = (select max(mathscore) from students)

union all 

select  student_id, name, 'Science' as subject, sciencescore as max_score from students
where sciencescore = (select max(sciencescore) from students)

union all 

select  student_id, name, 'English' as subject, englishscore as max_score from students
where englishscore = (select max(englishscore) from students)

/* for this task we first selected each subject and subquery in where clause we selected the max score in each subject with this we 
got max score of each subject and for each subject a different query was written and then with "union all" merged all the query to 
get a single table. */
/* with this result we can get to know if there are different students excelling different subject or only one person is at the top 
of all */


/* Overall topper across all courses. */

with top_students as (select sum(mathscore + sciencescore + englishscore) as total_score, student_id, name from students 
group by student_id, name)
select student_id, name, total_score from top_students
order by top_students desc
limit 1

/* for this task I used CTE to create a temporary table to get total score of all the subjects to get an overall result,
with that using the main query with condition of limit one and order by descending order, got the student who topped over all */
/* with this query we get to know who topped over all */


/* Pass rate per course (grade ≥ 40). */

select round(sum(case when mathscore >= 40 then 1 else 0 end) * 100.0/ count(*), 2) as math_pass_rate,
round(sum(case when sciencescore >= 40 then 1 else 0 end) * 100.0/ count(*), 2) as science_pass_rate, 
round(sum(case when englishscore >= 40 then 1 else 0 end) * 100.0/ count(*), 2) as english_pass_rate 
from students

/* for this task I used "case-when" statement for each subject to get a number on how many students passed in each subject, then 
using "sum" function to get a total of students passed, with that I divided that number by the total students using the count 
function to get a percentage of how many students passed to get a pass rate, did the same for each subject */
/* With this we get an idea in which subject students are struggling the most and so we can focus more on that subject and find 
the reason on why it is happening */

/* Students enrolled in multiple courses. */

select st.student_id, st.name from enrollments en
join students st on st.student_id = en.student_id
group by st.student_id, st.name
having count(distinct course_id) > 1

/* For this task I used having statement to get a count of distinct course_id more than 1 to get the result for multiple courses
we joined two tables to get the result */
/* With this result we can get to know how many students are enrolled to multiple */

/* ----------------------------------------------------------------------------------------------------------------------------*/

/* Task 4 */

/* Average grafe by gender */

select gender, case round(avg(grade_point),0)
when 4 then 'A'
when 3 then 'B'
when 2 then 'C'
when 1 then 'D'
else 'F' end as avg_grade from (select gender, case 
when (mathscore + sciencescore + englishscore) / 3.0 >= 90 then 4
when (mathscore + sciencescore + englishscore) / 3.0 >= 75 then 3
when (mathscore + sciencescore + englishscore) / 3.0 >= 60 then 2
when (mathscore + sciencescore + englishscore) / 3.0 >= 40 then 1
else 0
end as grade_point from students) t
group by gender;

/* For this task I converted the grade into numeric grade points using a CASE statement 
so that I could calculate the average grade per gender using the AVG function. 
Then I used a subquery to avoid repeating the grading logic multiple times. */

/* After calculating the average grade points, I converted the numeric result 
back into letter grades (A, B, C, D, F) using another CASE statement. */

/* With this result we can understand the overall academic performance trend 
of each gender in terms of grading scale rather than raw percentage. */


/* Pass rate per course */

select 
round(sum(case when mathscore >= 40 then 1 else 0 end) * 100.0 / count(*), 2) as math_pass_rate,
round(sum(case when sciencescore >= 40 then 1 else 0 end) * 100.0 / count(*), 2) as science_pass_rate,
round(sum(case when englishscore >= 40 then 1 else 0 end) * 100.0 / count(*), 2) as english_pass_rate
from students;

/* For this task I used CASE-WHEN to check which students scored 40 or above 
in each subject. Then I used SUM to count total passes and divided it by 
COUNT(*) to calculate the pass percentage. Finally, I multiplied by 100 
and used ROUND to format the result to 2 decimal places. */

/* This helps to quickly compare pass performance across subjects. */


/* Top 3 students overall */

with total_scores as (
select student_id, name,
(mathscore + sciencescore + englishscore) as total_score
from students
)
select student_id, name, total_score
from total_scores
order by total_score desc
limit 3;


/* For this I used a CTE to first calculate the total score of each student by adding marks of all three subjects. 
This created a temporary result set containing student_id, name and total_score. 

Then in the main query I selected from the CTE, ordered the total_score in descending order and used the LIMIT function 
to get the top 3 students. */

/* Through this we identified the three highest scoring students overall based on their combined subject performance. */



/* List students who are enrolled in multiple course */

select st.student_id, st.name
from enrollments en
join students st on st.student_id = en.student_id
group by st.student_id, st.name
having count(distinct course_id) > 1;

/* For this I joined the students and enrollments tables using student_id to combine student details with their course records. 

Then I grouped the data by student_id and name to count how many courses each student is enrolled in. 

Using the HAVING clause with COUNT(DISTINCT course_id) > 1, I filtered the result to show only those students who are 
enrolled in more than one course. */

/* With this result we can identify students who are pursuing multiple courses at the same time. */

