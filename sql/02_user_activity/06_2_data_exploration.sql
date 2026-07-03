with daily_auth as(
select to_timestamp(auth_ts)::date as time_st, uid
from auth_data
),
dau_all as (select time_st, count(distinct uid) as dau
from daily_auth 
group by time_st 
order by time_st asc)
select time_st, dau
from dau_all
where time_st >= '2020-07-01'
and time_st  <= '2020-10-30'
