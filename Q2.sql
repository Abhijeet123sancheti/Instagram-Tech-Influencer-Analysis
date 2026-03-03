#2.What are the highest and lowest recorded impressions for each post type?

select post_type, min(impressions), max(impressions) 
from gdb0120.fact_content
group by post_type ;
