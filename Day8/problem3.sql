--Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.
select  concat (round (((sum(gender = 'M')) * 100.0)/ count(*),2),'%') from patients

--or

SELECT
  round(100 * avg(gender = 'M'), 2) || '%' AS percent_of_male_patients
FROM
  patients;

--or

SELECT CONCAT(
    ROUND(
      (
        SELECT COUNT(*)
        FROM patients
        WHERE gender = 'M'
      ) / CAST(COUNT(*) as float),
      4
    ) * 100,
    '%'
  ) as percent_of_male_patients
FROM patients;
