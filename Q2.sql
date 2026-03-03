# 2. What are the highest and lowest recorded impressions for each post type? 

SELECT 
post_type,
MAX(impressions) AS "highest recorded impressions",
MIN(impressions) as "lowest recorded impressions"
FROM gdb0120.fact_content
GROUP BY post_type;
