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
on rd.uid = aat.uid)
select days_after_registration, round(100 * count(distinct rt.uid)/(sum(count(case when days_after_registration = 0 then 1 end)) over ()),2) as Day_N_Return_Rate
from retention_table rt
group by days_after_registration 
order by days_after_registration limit 31
