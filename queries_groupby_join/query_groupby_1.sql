# Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `total_students`, YEAR(`enrolment_date`) AS `year_of_enrolment`
FROM `students`
GROUP BY `year_of_enrolment`;