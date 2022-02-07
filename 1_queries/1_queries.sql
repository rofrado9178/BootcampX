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

