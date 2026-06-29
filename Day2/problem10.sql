-- Show all allergies ordered by popularity. Remove NULL values from query.
select allergies, count(*) as total_diagnosis
from patients
group by allergies 
having allergies is not null
order by total_diagnosis desc
;

--or
SELECT
  allergies,
  COUNT(*) AS total_diagnosis
FROM patients
WHERE
  allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC
--or
SELECT
  allergies,
  count(*)
FROM patients
WHERE allergies NOT NULL
GROUP BY allergies
ORDER BY count(*) DESC

