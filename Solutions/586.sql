select customer_number from orders group by customer_number order by count(order_number) desc limit 1;

-- Follow up
select customer_number from orders group by customer_number having count(*) = (select max(count) from (select count(*) from orders group by customer_number) X);
