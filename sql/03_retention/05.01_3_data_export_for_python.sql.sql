with reg_table as (
select to_timestamp(reg_ts)::date as reg_date, uid 
from reg_data 
),
auth_table as (
select to_timestamp(auth_ts)::date as auth_date, uid 
from auth_data
),
retention_table as (
select rd.uid, reg_date, auth_date, (auth_date - reg_date) as days_after_registration
from reg_table rd
join auth_table aat 
on rd.uid = aat.uid),
am_of_peo_mon as (
select date_trunc('month', reg_date)::date as reg_month, count(distinct uid) as cohort_size 
from retention_table 
group by 1
),
rtn_tbl as (
select reg_month, days_after_registration, cohort_size,count(distinct retention_table.uid) as users, round(count(distinct retention_table.uid)::numeric/cohort_size,4) as retention
from retention_table 
full join am_of_peo_mon 
on date_trunc('month', retention_table.reg_date)::date = am_of_peo_mon.reg_month  
group by 1,2,3
order by 1 desc
)
select days_after_registration, round(count(distinct uid)::numeric/(sum(count(case when days_after_registration = 0 then 1 end)) over()), 4) as retention
from retention_table
where days_after_registration between 0 and 30
group by days_after_registration
order by days_after_registration;
