-- For each doctor, display their id, full name, and the first and last admission date they attended.

SELECT doctor_id,CONCAT(first_name,' ',last_name), mIN(admission_date) as first_admission, MAX(admission_date) AS last_admission_date
FROM doctors,admissions 
where doctor_id = attending_doctor_id
group by doctor_id;

--or

select
  doctor_id,
  first_name || ' ' || last_name as full_name,
  min(admission_date) as first_admission_date,
  max(admission_date) as last_admission_date
from admissions a
  join doctors ph on a.attending_doctor_id = ph.doctor_id
group by doctor_id;
