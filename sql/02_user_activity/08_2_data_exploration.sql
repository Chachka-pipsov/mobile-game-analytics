with daily_auth as(
select to_timestamp(auth_ts)::date as time_st, uid
from auth_data
),
mau_all as (select date_trunc('month',time_st)::date as month, count(distinct uid) as mau
from daily_auth 
group by month 
order by month asc)
select month, mau
from mau_all


