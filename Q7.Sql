# 7. What is the percentage breakdown of total reach by post type?  The final output includes the following fields: 
# • post_type 
 # • total_reach 
# • reach_percentage




WITH reach_cte AS (
    SELECT post_type, sum(reach) AS total_reach
    FROM fact_content
    GROUP BY post_type
)
SELECT
    post_type,
    total_reach,
    ROUND(total_reach * 100.0 / SUM(total_reach) 
    OVER (), 2) AS reach_percentage
FROM reach_cte;

