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

--Get the total number of assignment submissions for each cohort.
SELECT cohorts.name as cohort, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

-- Get currently enrolled students' average assignment completion time.
SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration DESC;

-- Get the students who's average time it takes to complete an assignment is 
-- less than the average estimated time it takes to complete an assignment.

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;