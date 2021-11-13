select dept_name, coalesce(cnt, 0) as student_number from department left join (select count(dept_id) as cnt, dept_id as did from student group by dept_id) s on dept_id = did;
