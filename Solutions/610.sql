select x, y, z, case
  when x > y + z then 'No'
  when y > x + z then 'No'
  when z > x + y then 'No'
  else 'Yes'
end as triangle from triangle;
