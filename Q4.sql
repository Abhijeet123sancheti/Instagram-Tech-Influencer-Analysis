# 4. Create a report to get the statistics for the account. The final output includes the following fields: 
#         • month_name 
#         • total_profile_visits 
#         • total_new_followers 

SELECT 
    dates.month_name,
    SUM(accounts.profile_visits) AS total_profile_visits,
    SUM(accounts.new_followers) AS total_new_followers
FROM 
gdb0120.dim_dates dates
INNER JOIN 
gdb0120.fact_account accounts
ON dates.date = accounts.date
GROUP BY dates.month_name;
