select project_id, round(avg(experience_years),2) as average_years
from Project,Employee
where Project.employee_id = Employee.employee_id
group by project_id;
