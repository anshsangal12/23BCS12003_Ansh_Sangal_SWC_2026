SELECT extract(month from u.event_date) as month,count(distinct u.user_id) as monthly_active_users
from user_actions u
join user_actions u1
ON u.user_id = u1.user_id and extract(month from u.event_date) = 7 and extract(month from u1.event_date) =6 
group by extract(month from u.event_date)
