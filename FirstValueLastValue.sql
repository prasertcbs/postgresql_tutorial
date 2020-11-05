-- FIRST_VALUE(), LAST_VALUE()
-- LAST_VALUE ต้องระบุ rows between unbounded preceding and unbounded following เพื่อให้ทำงานกับช่วงที่ถูกต้อง

select year(intime) year, month(intime) month,
        sum(netpay) AS [revenue]
    from OrderHdr
    group by year(intime), month(intime)
    order by year, month

-- หาค่าแรกและค่าสุดท้ายตามเงื่อนไขที่กำหนดใน partition และ order
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) AS [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select Year, Month, revenue, 
		first_value(revenue) -- FIRST VALUE in the current partition
			over (
					partition by Year 
					order by month
                    -- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
				 ) as [first value],
		last_value(revenue) 
			over (
					partition by Year 
					order by month 
                    -- Default frame: RANGE UNBOUNDED PRECEDING AND CURRENT ROW
				 ) as [WRONG_last value],
		last_value(revenue) 
			over (
					partition by Year 
					order by month 
                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
				 ) as [CORRECT_last value]

	from cte
	ORDER BY Year, Month

/* ------------------------------------------------------------------------------------- */
-- ประยุกต์ใช้ first_value
-- หาว่ายอดขายในแต่ละเดือนเทียบกับยอดขายในเดือนแรกที่เปิดร้าน
-- สังเกตว่าไม่มีการทำ partition by year
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) AS [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select Year, Month, revenue, 
		first_value(revenue) -- FIRST VALUE in the current partition
			over (
					order by year, month
				 ) as [first value],
        revenue - first_value(revenue) -- ยอดขายเดือนปัจจุบันลบด้วยยอดขายของเดือนแรก
			        over (
					        order by year, month
				         ) as [current month revenue - first_value],
        format((revenue / first_value(revenue) -- ยอดขายเดือนปัจจุบันลบด้วยยอดขายของเดือนแรก
			        over (
					        order by year, month
				         )) - 1, 'p2') as [% chg.]

	from cte
	ORDER BY Year, Month