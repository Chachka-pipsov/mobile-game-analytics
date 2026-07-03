select count(t.user_id ), t.testgroup 
from ab_test t 
where t.revenue > 0
group by t.testgroup 