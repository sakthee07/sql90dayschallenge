select contest_id , round(per/count(u.user_id),2) as percentage from (
    select Register.contest_id as contest_id, (count(distinct Register.user_id))*100 as per
from Users , Register
where Users.user_id = Register.user_id
group by  Register.contest_id) as el ,Users u
group by contest_id
ORDER BY percentage DESC, contest_id ASC;

--or

select 
contest_id, 
round(count(distinct user_id) * 100 /(select count(user_id) from Users) ,2) as percentage
from  Register
group by contest_id
order by percentage desc,contest_id
