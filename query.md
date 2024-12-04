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