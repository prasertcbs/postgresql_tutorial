
-- ใช้ SUM() ในการหาผลรวมสะสม Cumulative/Running total 
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) as [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select year, month, revenue as [month-revenue],
	sum(revenue) over (
                        partition by year 
                        order by month
					  ) as [running total by year], -- สังเกตว่าเมื่อมีการเพิ่ม order by เข้าไป จะทำให้เกิด running total
	sum(revenue) over (
                        order by year, month
					  ) as [running total], -- สังเกตว่าเมื่อมีการเพิ่ม order by เข้าไป จะทำให้เกิด running total
	sum(revenue) over (partition by year) [year-revenue],
    sum(revenue) over () [grand total revenue] -- ไม่มีการระบุ partition จะเป็นการ sum() ทุกแถว
    from cte 
	order by year, month
