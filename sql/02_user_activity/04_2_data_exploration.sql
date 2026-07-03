with u_activity as (
select uid, count(*) as auth_count
from auth_data 
group by uid),
groups as (
select
case 
	when auth_count = 1 then '1'
	when auth_count between 2 and 10 then '2-10'
	when auth_count between 11 and 100 then '11-100'
	when auth_count between 101 and 500 then '101-500'
	when auth_count between 501 and 1000 then '501-1000'
	else '1001+'
end as activity_group,
uid, auth_count 
from u_activity),
distr as (select activity_group, count(*) as count_users
from groups
group by activity_group)
select activity_group, count_users, round(count_users*100/sum(count_users) over (),2) as percentage
from distr  
order by 
case activity_group
when '1' then 1
when '2-10' then 2
when '11-100' then 3
when '101-500' then 4
when '501-1000' then 5
else 6
end;