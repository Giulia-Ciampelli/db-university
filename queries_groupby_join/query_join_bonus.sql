# BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18
SELECT `students`.`name` AS `student_name`,
`students`.`surname` AS `student_surname`,
COUNT(`exam_student`.`vote`) AS `exam_try_total`,
MAX(`exam_student`.`vote`) AS `highest_vote`
FROM `students`
JOIN `exam_student` ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams` ON `exam_student`.`exam_id` = `exams`.`id`
GROUP BY `student_name`, `student_surname`
HAVING `highest_vote` >= 18;