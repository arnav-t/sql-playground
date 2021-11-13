select name from salesperson S left join (select sales_id from orders where com_id = (select com_id from company where name = 'RED')) O on S.sales_id = O.sales_id where O.sales_id IS NULL;
