# 1. How many unique post types are found in the 'fact_content' table? 

SELECT 
COUNT(DISTINCT(post_type)) AS "Unique post types "
FROM gdb0120.fact_content;
