select count(auth_ts) as am_of_auth, uid
from auth_data ad 
group by uid