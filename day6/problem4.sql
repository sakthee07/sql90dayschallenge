--Show the first_name, last_name, and height of the patient with the greatest height.

SELECT
  first_name,
  last_name,
  MAX(height) AS height
FROM patients;
-- May not be supported in every sql language.


-- or
SELECT
  first_name,
  last_name,
  height
FROM patients
WHERE height = (
    SELECT max(height)
    FROM patients
  )
