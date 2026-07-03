select round(count(auth_ts)/count(distinct uid)::numeric,2) as av_of_auth
from auth_data ad 