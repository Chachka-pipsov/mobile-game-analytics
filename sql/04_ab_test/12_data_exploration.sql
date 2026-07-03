select round(sum(t.revenue)/count(t.user_id )::numeric,2) as arpu, t.testgroup 
from ab_test t 
group by t.testgroup 
