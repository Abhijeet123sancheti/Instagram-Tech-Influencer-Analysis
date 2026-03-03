# Create a report that includes the quarter, total comments, and total saves recorded for each post category. Assign the following quarter groupings: 
#        (January, February, March) → “Q1” 
#        (April, May, June) → “Q2” 
#        (July, August, September) → “Q3” 
# The final output columns should consist of: 
#          post_category 
#          quarter 
#          total_comments 
#          total_saves


WITH base AS (
SELECT
c.post_category,
CASE
WHEN d.month_name IN ('January','February','March') THEN 'Q1'
WHEN d.month_name IN ('April','May','June') THEN 'Q2'
WHEN d.month_name IN ('July','August','September') THEN 'Q3'
END AS quarter,
c.comments,
c.saves
FROM fact_content c
JOIN dim_dates d ON d.date = c.date
)
SELECT
    post_category,
    quarter,
    SUM(comments),
    SUM(saves)
FROM base
GROUP BY post_category, quarter;
