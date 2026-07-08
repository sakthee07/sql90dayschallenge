-- Show patient_id, first_name, last_name, and attending doctor's specialty.
-- Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

-- Check patients, admissions, and doctors tables for required information.

SELECT p.patient_id , p.first_name as patient_first_name,p.last_name as patient_last_name, d.specialty as 
attending_doctor_specialty
FROM patients p
join admissions a 
on p.patient_id = a.patient_id
join doctors d 
on d.doctor_id = a.attending_doctor_id
where a.diagnosis = 'Epilepsy' and d.first_name = 'Lisa' ;

--or
--using CTE

with patient_table as (
    SELECT
      patients.patient_id,
      patients.first_name,
      patients.last_name,
      admissions.attending_doctor_id
    FROM patients
      JOIN admissions ON patients.patient_id = admissions.patient_id
    where
      admissions.diagnosis = 'Epilepsy'
  )
select
  patient_table.patient_id,
  patient_table.first_name,
  patient_table.last_name,
  doctors.specialty
from patient_table
  JOIN doctors ON patient_table.attending_doctor_id = doctors.doctor_id
WHERE doctors.first_name = 'Lisa';
