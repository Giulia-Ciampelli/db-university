# Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`,
`teachers`.`id`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname`
FROM `teachers`
JOIN `course_teacher` ON `course_teacher`.`teacher_id` = `teachers`.`id` # collegato teachers la tabella pivot
JOIN `courses` ON `course_teacher`.`course_id` = `courses`.`id` # collegato anche courses alla tabella pivot
WHERE `teachers`.`id` = 44;