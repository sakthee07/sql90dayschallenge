--Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table

select p.product_name,
       c.company_name,
       cat.category_name
from products p
join suppliers c
on p.supplier_id = c.supplier_id 
Join categories cat
On p.category_id= cat.category_id;
