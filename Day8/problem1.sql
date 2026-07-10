-- Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

Select province_name from province_names
join
(select 
    sum (case when gender = 'M' then 1 end ) as M,
    sum (case when gender = 'F' then 1 end ) as F ,
    province_id
from patients
group by province_id) as el
on province_names.province_id = el.province_id
where el.M > el.F;
--or
SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  COUNT( CASE WHEN gender = 'M' THEN 1 END) > COUNT( CASE WHEN gender = 'F' THEN 1 END);
--or
SELECT province_name
FROM (
    SELECT
      province_name,
      SUM(gender = 'M') AS n_male,
      SUM(gender = 'F') AS n_female
    FROM patients pa
      JOIN province_names pr ON pa.province_id = pr.province_id
    GROUP BY province_name
  )
WHERE n_male > n_female;
--or
SELECT pr.province_name
FROM patients AS pa
  JOIN province_names AS pr ON pa.province_id = pr.province_id
GROUP BY pr.province_name
HAVING
  SUM(gender = 'M') > SUM(gender = 'F');
