
-- ค่าเฉลี่ยเคลื่อนที่ (moving average)
-- ใช้ AVG() ในการหา Moving Average
-- ใช้ COUNT() ในการนับจำนวนแถวแยกตาม partition

-- แสดงยอดขายแยกตามเดือนของแต่ละปี
select year(intime) year, month(intime) month,
        sum(netpay) as [revenue]
    from OrderHdr
    group by year(intime), month(intime)
    order by year, month

-- 3-month moving average
-- Frame จะเป็นการกำหนดส่วนย่อยภายใน Partition เพื่อระบุว่าต้องการใช้ตั้งแต่แถวในถึงแถวใดใน Partition
-- แสดงการใช้ FRAME ROWS BETWEEN 2 PRECEDING AND CURRENT ROW -- 2 บรรทัดก่อนหน้า, 0 บรรทัดปัจจุบัน
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) as [revenue]
        from OrderHdr
        group by year(intime), month(intime)
)
select year, month, revenue,
	avg(revenue) 
        over (  partition by year
                order by year, month
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW -- 2 บรรทัดก่อนหน้า, 0 บรรทัดปัจจุบัน
             ) as [3-month moving avg v1],
	avg(revenue) 
        over (  -- without partition by year
                order by year, month
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW -- 2 บรรทัดก่อนหน้า, 0 บรรทัดปัจจุบัน
             ) as [3-month moving avg v2]
	from cte 
	order by year, month

/* ----------------------------------------------------------------- */
-- moving avg. โดยแสดงค่า NULL สำหรับแถวที่มี lag ไม่พอในการคำนวณ moving avg
-- เช่น หากทำการคำนวณ 3-month moving avg. เดือนที่ 1 และ 2 จะไม่สามารถคำนวณได้ จึงแสดงค่าเป็น NULL
;with cte as (
	select year(intime) year, month(intime) month,
            sum(netpay) as [revenue]
        from OrderHdr
        group by year(intime), month(intime)
),
cte2 as (
    select year, month, revenue,
	    count(revenue) 
            over (
                    partition by year 
                    order by month
                    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW -- FRAME 2 บรรทัดก่อนหน้า, 0 บรรทัดปัจจุบัน
                 ) as [rows count],
	    avg(revenue) 
            over (
                    partition by year 
                    order by month
                    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW -- 2 บรรทัดก่อนหน้า, 0 บรรทัดปัจจุบัน
                 ) as [3-month moving avg]
	    from cte
)
select year, month, revenue, 
        [rows count], 
        [3-month moving avg],
        case
            when [rows count] >= 3 then [3-month moving avg]
            else NULL
        end as [corrected moving avg.]
    from cte2
    order by year, month
