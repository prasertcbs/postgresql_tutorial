
-- Common Table Expression (CTE) ทำหน้าที่เสมือนวิวชั่วคราว เพื่อให้ชุดคำสั่งสืบค้นนำค่าไปใช้

/* ---------------------------------------------------------------------------- */
-- Q: ยอดขายแยกตามเดือนและปี	
select * from OrderHdr

select year(intime), month(intime), sum(NetPay)
	from OrderHdr
	group by year(intime), month(intime)

;with cte as
(
	select year(intime) year, month(intime) month, sum(NetPay) revenue
		from OrderHdr
		group by year(intime), month(intime)
)
select * from cte

;with cte(year, month, revenue) as
(
	select year(intime), month(intime), sum(NetPay)
		from OrderHdr
		group by year(intime), month(intime)
)
select * from cte

/* ---------------------------------------------------------------------------- */
-- Q: แสดงยอดขายแยกตามวันธรรมดา เสาร์อาทิตย์ ของแต่ละปี
-- multiple CTEs
;with AllDays as
(
	select  year(intime) year, 'All days' as period,
			datepart(weekday, intime) as weekday,
			sum(Netpay) as revenue
		from OrderHdr
		group by year(intime), datepart(weekday, intime)
),
MonToFri as (
	select year, 'Mon-Fri' as period, sum(revenue) as revenue
		from AllDays
		where weekday in (2, 3, 4, 5, 6)
		group by year
),
SatSun as (
	select year, 'Sat-Sun' as period, sum(revenue) as revenue
		from AllDays
		where weekday in (1, 7)
		group by year
)
select year, period, revenue from MonToFri
union
select year, period, revenue from SatSun
union
select year, period, sum(revenue) from AllDays
	group by year, period
order by year, period