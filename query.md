*query 1*
SELECT `date_of_birth`
FROM `students`
WHERE year(`date_of_birth`) = 1990;

*query 2*
SELECT `cfu`
FROM `courses`
WHERE `cfu` > 10;

*query 3*
SELECT `date_of_birth`
FROM `students`
WHERE year(`date_of_birth`) < 1994;

*query 4*
SELECT *
FROM `courses`
WHERE `year` = 1
AND `period` = 'I semestre';

*query 5*
SELECT *
FROM `exams`
WHERE hour > '14:00'
AND date = '2020-06-20';

*query 6*
SELECT *
FROM `degrees`
WHERE `level` = 'magistrale';

*query 7*
SELECT COUNT(*)
FROM  `departments`;

*query 8*
SELECT COUNT(*)
FROM `teachers`
WHERE `phone` IS NULL;

*query 9*
INSERT INTO students (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (1, 'Giulia', 'Ciampelli', '1996-05-25', 'GGGCCC00G11B777P', '2024-12-04', '999999', 'g.ciampelli@email.org');

*query 10*
UPDATE teachers
SET office_number = 126
WHERE id = 56;

*query 11*
DELETE FROM students
WHERE id = 5001;

## GROUP BY

*query 1*
SELECT COUNT(*) AS `total_students`, YEAR(`enrolment_date`) AS `year_of_enrolment`
FROM `students`
GROUP BY `year_of_enrolment`;

## JOIN
