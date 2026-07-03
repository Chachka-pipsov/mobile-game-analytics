select rd.uid
from reg_data rd 
right join auth_data ad 
on rd.uid = ad.uid
where rd.uid is null