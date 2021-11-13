SELECT b.name FROM (SELECT managerid FROM employee GROUP BY managerid HAVING COUNT(managerid) >= 5) a JOIN employee b ON b.id = a.managerid;
