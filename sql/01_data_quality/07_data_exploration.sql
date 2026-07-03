select count(user_id), count(case
	when user_id is Null then 1
end
) as count_null_id
from ab_test t 
