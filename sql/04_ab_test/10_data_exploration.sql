select sum(revenue), testgroup
from ab_test
group by testgroup 