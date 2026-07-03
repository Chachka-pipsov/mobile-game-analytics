select testgroup as groups, count(*)
from ab_test t 
group by "groups" 
