--Show the total amount of orders for each year/month.
select year(order_date) as order_year,
       month(order_date) As order_month,
       count(*)
from orders
group by order_year,order_month;
