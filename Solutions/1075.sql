select project_id, round(avg(experience_years), 2) from Project P join Employee E on P.employee_id = E.employee_id group by project_id order by project_id;

