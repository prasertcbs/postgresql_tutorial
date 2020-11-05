-- LEAD and LAG
-- แถวก่อนหน้า n แถว (lag)
-- แถวถัดไป n แถว (lead)

-- version 1 (DEFAULT lead, lag)
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) AS [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select Year, Month, revenue, 
		lag(revenue) -- แถวก่อนหน้า 1 แถว
			over (
					partition by Year 
					order by month
				 ) as [prev_lag],
		lead(revenue) -- แถวถัดไป 1 แถว
			over (
					partition by Year 
					order by month
				 ) as [next_lead]
	from cte
	ORDER BY Year, Month

/* ------------------------------------------------------------- */
-- คำนวณการเปลี่ยนแปลงยอดขายเทียบกับเดือนก่อนหน้า
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) AS [revenue]
        from OrderHdr
        group by year(intime), month(intime)
),
cte2 as (
select Year, Month, revenue, 
	lag(revenue) -- แถวก่อนหน้า 1 แถว
		over (
				partition by Year 
				order by month
			 ) as [prev_lag], 
	lead(revenue) -- แถวถัดไป 1 แถว
		over (
				partition by Year 
				order by month
			 ) as [next_lead] 
from cte
)
-- select * from cte2
select Year, Month, revenue, [prev_lag],
		revenue - [prev_lag] as [this - prev],
        (revenue - [prev_lag]) / [prev_lag] as [% chg]
	from cte2
	ORDER BY Year, Month

/* ------------------------------------------------------------- */
-- version 2 (REPLACE NULL values returned from LEAD, LAG with a specific value)
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) AS [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select Year, Month, revenue, 
		lag(revenue, 1, 0) -- 1 หมายถึง ก่อนหน้า 1 แถว, 0 หมายถึง หากมีค่าเป็น NULL ให้แทนที่ด้วย 0
				over (
						partition by Year 
						order by Month
					 ) as [prev_lag], 
		lead(revenue, 1, 0) -- 1 หมายถึง ถัดไป 1 แถว, 0 หมายถึง หากมีค่าเป็น NULL ให้แทนที่ด้วย 0
				over (
						partition by Year 
						order by Month
					 ) as [next_lead] 
	from cte
	ORDER BY Year, Month
