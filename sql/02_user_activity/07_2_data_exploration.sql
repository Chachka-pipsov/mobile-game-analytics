with daily_auth as(
select to_timestamp(auth_ts)::date as time_st, uid
from auth_data
),
wau_all as (select date_trunc('week',time_st)::date as week, count(distinct uid) as wau
from daily_auth 
group by week 
order by week asc)
select week, wau
from wau_all


