select uid 
from reg_data rd 
group by uid
having count(*) > 1