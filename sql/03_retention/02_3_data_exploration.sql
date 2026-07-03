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
on rd.uid = aat.uid
order by uid, auth_date, reg_date asc)
select case 
when days_after_registration = 1 then '1 day'
when days_after_registration = 1 then '1 day'
end as retention
from retention_table 
