select count(*) as duplicate
from ab_test t 
group by t.user_id 
having count(*)>1