select uid 
from reg_data 
group by uid
having count(*) > 1