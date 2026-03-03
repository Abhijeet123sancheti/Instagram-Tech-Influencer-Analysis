# 4. Create a report to get the statistics for the account. The final output includes the following fields: 
#         • month_name 
#         • total_profile_visits 
#         • total_new_followers 

with cte as (select d.month_name,a.profile_visits, a.new_followers from dim_dates d
inner join fact_account a
on d.date = a.date)

select month_name,
sum(profile_visits) as total_profile_visits,
sum(new_followers) as total_followers
from cte 
group by month_name;
