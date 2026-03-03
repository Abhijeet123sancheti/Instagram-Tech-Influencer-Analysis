# 6. Create a report that displays the unique post_category names alongside their respective counts for each month. The output should have three columns:  
# • month_name 
# • post_category_names  
# • post_category_count 




with cte as (select  d.date,d.month_name, 
group_concat(distinct c.post_category) as cex
 from fact_content c
inner join dim_dates d
on c.date = d.date
group by d.month_name)
select month_name,  cex as post_category_name, 
(LENGTH(cex) - LENGTH(replace(cex,",",""))+1) 
as post_category_count
 from cte
 order by date;
