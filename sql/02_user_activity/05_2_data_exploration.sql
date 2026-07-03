with daily_auth as(
select to_timestamp(auth_ts)::date as time_st, uid
from auth_data
),
dau_all as (select time_st, count(distinct uid) as dau
from daily_auth 
group by time_st 
order by time_st asc)
select min(dau),max(dau), round(avg(dau),2)
from dau_all
