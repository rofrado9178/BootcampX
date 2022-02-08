----------------------------- JOIN TABLE ----------------------------------
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students JOIN cohorts ON cohorts.id = cohort_id;

-- INNER JOIN , notes -> data without cohort_id or foreign key is null will not appear
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students INNER JOIN cohorts ON cohorts.id = cohort_id;

--------------------------- OUTER JOIN ------------------------------ 
--we need to specify either LEFT, RIGHT or FULL



--LEFT OUTER JOIN -> will show student even without cohort_id
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students LEFT OUTER JOIN cohorts ON cohorts.id = cohort_id;
--RIGHT OUTER JOIN -> will show even without any students enrolled
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id;
--FULL OUTER JOIN -> will return cohorts and all students even when the is no match
SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;


-- We could also rewrite any RIGHT JOIN as a LEFT JOIN, 
-- just by changing the order of the tables.
-- So the following two queries would produce identical results:

FROM students LEFT JOIN cohorts ON cohorts.id = cohort_id;
FROM cohorts RIGHT JOIN students ON cohorts.id = cohort_id;
-- THE RESULT WILL BE THE SAME


-- Get the total amount of time that a student has spent on all assignments. 
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- Get the total amount of time 
-- that all students from a specific cohort have spent on all assignments.

-- This should work for any cohort but use FEB12 for now.
-- Select only the total amount of time as a single column.
-- You can write as many JOIN statements as you need in a single query. 
-- Expected Result:

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12';


--Get all cohorts with 18 or more students.
SELECT cohorts.name as cohort_name, count(students.*) AS student_count 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohort_name 
HAVING count(students.*) >= 18
ORDER BY student_count;

--Get the total number of assignment submissions for each cohort.

