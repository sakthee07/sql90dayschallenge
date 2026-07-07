--Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.

select distinct city as unique_city from patients
where province_id = 'NS';

--or
SELECT city
FROM patients
GROUP BY city
HAVING province_id = 'NS';
