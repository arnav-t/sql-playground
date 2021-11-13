select A.project_id, B.employee_id from (select project_id, max(experience_years) as exp from Project P join Employee E on P.employee_id = E.employee_id group by project_id) A join (select project_id, P.employee_id, experience_years from Project P join Employee E on P.employee_id = E.employee_id) B on A.project_id = B.project_id and A.exp =
B.experience_years;

-- solution with IN
select P.project_id, P.employee_id from Project P join Employee E on P.employee_id = E.employee_id where (P.project_id, E.experience_years) in (select P.project_id, max(experience_years) as experience_years from Project P join Employee E on P.employee_id = E.employee_id group by P.project_id);
