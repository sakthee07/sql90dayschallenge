--Show how many patients have a birth_date with 2010 as the birth year.

select count(*) as total_patients
from patients
where Year(birth_date) = 2010;

--or

SELECT count(first_name) AS total_patients
FROM patients
WHERE
  birth_date >= '2010-01-01'
  AND birth_date <= '2010-12-31'
--or
SELECT count(first_name) AS total_patients
FROM patients
WHERE
  birth_date between '2010-01-01' AND '2010-12-31'
