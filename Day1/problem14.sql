--Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, "Late" if the order shipped late, "Not Shipped" if shipped_date is null.

--Order by employee last_name, then by first_name, and then descending by number of orders.

select e.first_name,
       e.last_name,
       count(o.order_id) as num_orders,
       case
           when shipped_date <= required_date then 'On Time'
           when shipped_date > required_date then 'Late'
           WHen shipped_date is null then 'Not Shipped'
       END as Shipped 
       
from employees e 
join orders o
on e.employee_id = o.employee_id
group by e.first_name,e.last_name,shipped
order by e.last_name, e.first_name,num_orders desc;

-- --Why?

-- If shipped_date is NULL,

-- NULL < required_date

-- is not true.

-- It's better to check for NULL first.
