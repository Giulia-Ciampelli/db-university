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