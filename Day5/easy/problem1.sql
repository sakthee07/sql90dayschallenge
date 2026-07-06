--Show first name of patients that start with the letter 'C'

select first_name from patients
where first_name like 'C%';

--or

SELECT first_name
FROM patients
WHERE substring(first_name, 1, 1) = 'C'
