SELECT *
FROM students
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;