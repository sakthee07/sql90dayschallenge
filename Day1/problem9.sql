--Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.

select round(avg(unit_price),2) as average_price,
       sum(units_in_stock) as total_stock,
       SUM(discontinued) As total_discontinued
from products;
