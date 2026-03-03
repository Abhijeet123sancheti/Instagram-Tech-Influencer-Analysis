#9. List the top three dates in each month with the highest number of new
#followers. The final output should include the following columns:
#• month
#• date
#• new_followers


WITH ranked_data AS (
    SELECT
        d.month_name AS month,
        d.date,
        f.new_followers,
        ROW_NUMBER() OVER (
            PARTITION BY d.month_name
            ORDER BY f.new_followers DESC
        ) AS rn
    FROM fact_account f
    INNER JOIN dim_dates d
        ON f.date = d.date
)

SELECT
    month,
    date,
    new_followers
FROM ranked_data
WHERE rn <= 1
ORDER BY date, new_followers DESC;
