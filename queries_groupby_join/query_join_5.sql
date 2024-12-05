# Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degrees_name`,
`courses`.`name` AS `courses_name`,
`teachers`.`name` AS `teachers_name`,
`teachers`.`surname` AS `teachers_surname`
FROM `degrees` # piano d'azione: degrees>courses>course_teacher>teachers
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id`
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;