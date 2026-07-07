select u.user_id ,
round(avg(
    case 
    when action = 'confirmed' then 1
    else 0
    end),2) as confirmation_rate
from Signups u
left join Confirmations c
on u.user_id = c.user_id
