with reg_table as (
select to_timestamp(reg_ts)::date as reg_date, uid as reg_uid
from reg_data 
),
auth_table as (
select to_timestamp(auth_ts)::date as auth_date, uid as au_uid
from auth_data
)
select reg_uid, reg_date, auth_date, (auth_date - reg_date) as days_after_registration
from reg_table rd
join auth_table aat 
on rd.reg_uid = aat.au_uid
order by reg_uid, auth_date, reg_date asc 