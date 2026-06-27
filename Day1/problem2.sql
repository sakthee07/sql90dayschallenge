--Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain' 
select contact_name,address,city 
  from customers
  where country Not in ('Germany','Mexico','Spain');
