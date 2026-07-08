-- All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

-- The password must be the following, in order:
-- 1. patient_id
-- 2. the numerical length of patient's last_name
-- 3. year of patient's birth_date

select distinct patients.patient_id,concat(patients.patient_id,len(last_name),year(birth_date)) as temp_password from patients,admissions
where patients.patient_id=admissions.patient_id;

/*
  Start by selecting a question by pressing 'Start' or 'View All Questions'.
  Use the resources and information about the database from the left panel to help.
  Press the run button to execute the query.
  Question is automatically validated every time you execute the query.
  Make your output match the expected output.
 
 
  Keybinds:
    [ctrl + enter]: Execute the SQL
    [ctrl + q]: Auto-format the SQL
*/
