select to_timestamp(min(reg_ts)) as first_reg,
to_timestamp(max(reg_ts)) as last_reg
from reg_data rd 