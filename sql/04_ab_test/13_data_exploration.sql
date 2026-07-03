select round(sum(t.revenue)/count(case when revenue > 0 then user_id end)::numeric,2) as arppu, t.testgroup 
from ab_test t 
group by t.testgroup 

