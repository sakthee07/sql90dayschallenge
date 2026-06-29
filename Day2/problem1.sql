--Show unique birth years from patients and order them by ascending.

SELECT distinct Year(birth_date) as birth_year FROM patients
order by birth_year asc;
