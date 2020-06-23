# 1.Query the existence of 1 course
select * from course WHERE id = 1;
# 2.Query the presence of both 1 and 2 courses
select * from course WHERE id = 1 or id = 2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select sc.studentId,s.name,AVG(score) FROM student_course sc,student s WHERE sc.studentId = s.id GROUP BY sc.studentId HAVING AVG(sc.score)>60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in(select studentId from student_course GROUP BY studentId);
# 5.Query all SQL with grades
select score from student_course;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student where id in(select studentId from student_course where studentId = 1 and courseId = 2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select score from student_course where studentId = 4 and score<60 ORDER BY score DESC;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select AVG(score) FROM student_course GROUP BY studentId ORDER BY AVG(score) DESC,studentId ASC;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select s.name,sc.score FROM student_course sc,student s WHERE sc.studentId = s.id and sc.courseId in(select id from course where name = 'math') and sc.score<60 GROUP BY sc.studentId;
