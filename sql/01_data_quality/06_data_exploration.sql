select rd.uid 
from reg_data rd 
left join auth_data ad 
on rd.uid = ad.uid 
where ad.uid is null;