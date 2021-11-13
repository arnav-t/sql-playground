-- ugly
select distinct(buyer_id) from sales where buyer_id in (select buyer_id from sales join product on sales.product_id = product.product_id where product_name = 'S8') and buyer_id not in (select buyer_id from sales join product
on sales.product_id = product.product_id where product_name = 'iPhone');

-- better
select buyer_id from sales join product on sales.product_id = product.product_id group by buyer_id having sum(case when product_name = 'S8' then 1 else 0 end) > 0 and sum(case when product_name = 'iPhone' then 1 else 0 end) = 0;
