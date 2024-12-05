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

*query 2*
SELECT COUNT(*) AS `total_teachers`, `office_address`
FROM `teachers`
GROUP BY `office_address`;

*query 3*
SELECT AVG(`vote`) AS `average_vote`, `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

*query 4*
SELECT COUNT(`degrees`.`id`) AS `degree_count`,
`departments`.`name`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
GROUP BY `departments`.`id`, `departments`.`name`;

## JOIN

*query 1*
SELECT `students`.*,
`degrees`.`name` AS `degree_name`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

*query 2*
SELECT `degrees`.*,
`departments`.`name` AS `department_name`
FROM `departments`
JOIN `degrees`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze'
AND `degrees`.`level` = 'magistrale';

*query 3*
SELECT `courses`.`name`,
`teachers`.`id`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname`
FROM `teachers`
JOIN `course_teacher` ON `course_teacher`.`teacher_id` = `teachers`.`id` # collegato teachers la tabella pivot
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id` # collegato anche courses alla tabella pivot
WHERE `teachers`.`id` = 44;

*query 4*
SELECT `students`.*,
`departments`.`name` AS `department_name`,
`degrees`.`name` AS `degree_name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name` ASC;

*query 5*
SELECT `degrees`.`name` AS `degrees_name`,
`courses`.`name` AS `courses_name`,
`teachers`.`name` AS `teachers_name`,
`teachers`.`surname` AS `teachers_surname`
FROM `degrees` # piano d'azione: degrees>courses>course_teacher>teachers
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;

*query 6*
SELECT DISTINCT `teachers`.*
FROM `teachers`
JOIN `course_teacher` ON `course_teacher`.`teacher_id` = `teachers`.`id` # piano d'azione: teachers>course_teachers>courses>degrees>departments
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`;

*query 7*
SELECT `students`.`name` AS `student_name`,
`students`.`surname` AS `student_surname`,
COUNT(`exam_student`.`vote`) AS `exam_try_total`,
MAX(`exam_student`.`vote`) AS `highest_vote`
FROM `students`
JOIN `exam_student` ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
GROUP BY `student_name`, `student_surname`
WHERE `highest_vote` >= 18;