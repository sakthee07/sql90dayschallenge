--For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem

select p.first_name || ' ' || p.last_name as patient_fullname, a.diagnosis 
, d.first_name || ' ' || d.last_name as doctor_fullname
from admissions a,patients p,doctors d
where a.patient_id = p.patient_id and a.attending_doctor_id = d.doctor_id;
--or
SELECT
  CONCAT(patients.first_name, ' ', patients.last_name) as patient_name,
  diagnosis,
  CONCAT(doctors.first_name,' ',doctors.last_name) as doctor_name
FROM patients
  JOIN admissions ON admissions.patient_id = patients.patient_id
  JOIN doctors ON doctors.doctor_id = admissions.attending_doctor_id;
