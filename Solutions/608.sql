select A.id, case 
    when A.p_id is null then 'Root' 
    when B.p_id is null then 'Leaf' 
    else 'Inner' 
end as Type from tree as A left join (select distinct p_id from tree) as B on A.id = B.p_id;
