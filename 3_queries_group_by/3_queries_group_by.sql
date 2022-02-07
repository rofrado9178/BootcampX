-- If we want to calculate the total number of assignment_submissions 
-- for all students, the count aggregate function is perfect.
SELECT count(assignment_submissions.*) as total_submissions
FROM assignment_submissions;

--  apply the count() function to groups of data, rather than the entire query. 
--  The groups in this case are the names of students.
-- We want to apply the count() function for each students.name.
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name;

