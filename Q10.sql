# Create a stored procedure that takes the 'Week_no' as input and
#generates a report displaying the total shares for each 'Post_type'. The
#output of the procedure should consist of two columns:
#• post_type
#• total_shares


CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_shares_by_week`(IN p_week_no varchar(10))
BEGIN

    SELECT
        c.post_type,
        SUM(c.shares) AS total_shares
    FROM fact_content c
    INNER JOIN dim_dates d
        ON c.date = d.date
    WHERE d.week_no = p_week_no
    GROUP BY c.post_type;

END
