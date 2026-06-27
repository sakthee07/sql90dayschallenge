--Show the category_name and the average product unit price for each category rounded to 2 decimal places.
select cat.category_name, round(Avg(p.unit_price),2) as average_unit_price
from products p
join categories cat
on p.category_id = cat.category_id
group by cat.category_name;
