# 3. Filter all the posts that were published on a weekend in the month of March and April and export them to a separate csv file.

select c.date,d.month_name,  
d.weekday_or_weekend,c.post_category,c.carousel_item_count,
c.post_type from gdb0120.fact_content c
inner join  dim_dates d 
on d.date = c.date
where month_name in( "March" ,"April" )
and weekday_or_weekend = "Weekend";
 

