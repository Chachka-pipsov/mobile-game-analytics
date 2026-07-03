select uid, count(auth_ts) as am_of_au
from auth_data ad 
group by ad.uid 
order by am_of_au desc
limit 10