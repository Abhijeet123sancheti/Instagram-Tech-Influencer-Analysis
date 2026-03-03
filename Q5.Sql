# 5. Write a CTE that calculates the total number of 'likes’ for each 'post_category' during the month of 'July' and subsequently, arrange the 
#            'post_category' values in descending order according to their total likes.


with cte as (select c.post_category ,
sum(c.likes)as likes_sum from fact_content c
inner join dim_dates d
on d.date = c.date
where d.month_name ='July'
group by c.post_category)
select * from cte
order by likes_sum desc;
