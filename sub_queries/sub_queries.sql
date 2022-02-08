--Get the total number of in complete assignment submissions for a student

SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

--Now imagine that we want to calculate the average number of students 
--that attend a cohort. We can calculate 
--the total number of students for each cohort with the following query.
SELECT count(students)
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts;

--But how do we get a single number for the average number of students per cohort?
SELECT count(students) as total_students
FROM students
JOIN cohorts on cohorts.id = cohort_id
GROUP BY cohorts;

--we essentially want to find the average of the total_students column.

SELECT avg(total_students) as average_students
FROM (
  SELECT count(students) as total_students
  FROM students
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts
) as totals_table;

-- Let's say we wanted to get the name of all incomplete assignments for a student. 
-- It's a fairly simple query to get all completed assignments for a student.

--return only one column
SELECT assignments.name
FROM assignments 
WHERE id NOT IN
(
  SELECT assignment_id
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel'
);

-- This will return the name of all assignments not completed by 'Ibrahim Schimmel'.

