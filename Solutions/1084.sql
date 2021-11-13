select S.product_id, product_name from sales S join product P on S.product_id = P.product_id group by S.product_id, product_name having sum(case when sale_date between '2019-01-01' and ' 2019-03-31' then 1 else 0 end) > 0 and s
um(case when sale_date between '2019-01-01' and ' 2019-03-31' then 0 else 1 end) = 0;
