-- select their id and name
-- Order them by their name in alphabetical order.
-- Since this query needs to work with any specific cohort, 
-- just use any number for the cohort_id.

SELECT id, name 
FROM students 
WHERE cohort_id = 1
ORDER BY name;

-- Select the total number of students who were in the first 3 cohorts.

SELECT count(id)
FROM students 
WHERE cohort_id IN (1,2,3);

-- Get all of the students that don't have an email or phone number.
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL
OR phone IS NULL;

-- Get all of the students without a gmail.com account and a phone number.
SELECT name, id, email, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com'
AND phone IS NULL;

-- Get all of the students currently enrolled.

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

-- Get all graduates without a linked Github account.

SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;

-- A currently enrolled student has a null end_date.
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

-- Now that we know how to get the total submissions for currently enrolled students, 
-- let's refine the query a bit more. Let's only return currently enrolled students 
-- who's total submissions are less than 100;
SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100
ORDER BY students.name;

----------------- CONCLUSION -----------------
-- GROUP BY allows us to combine 
-- the results based on a column so an aggregate can be applied to each group.

-- HAVING allows us to filter our 
-- results based on the result of an aggregate function.

-- This makes using aggregate functions much more powerful in our queries.
