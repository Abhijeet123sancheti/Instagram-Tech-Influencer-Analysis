# 3. Filter all the posts that were published on a weekend in the month of March and April and export them to a separate csv file.

SELECT content.* 
FROM gdb0120.dim_dates dates
INNER JOIN 
gdb0120.fact_content content
ON dates.date = content.date
WHERE 
(MONTH(dates.date) = "3" OR MONTH(dates.date) = "4")
AND LOWER(dates.weekday_or_weekend) = "weekend"
;
