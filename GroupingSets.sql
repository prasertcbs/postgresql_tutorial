/*
Grouping sets (SQL 2008+)
หาผลรวมของคอลัมน์ตาม group ที่กำหนด
*/

/* ---------------------------------------------------------- */
select categoryid, count(*) as [# menu]
	from menu
	group by categoryid
union
select 'total', count(*) as [# menu]
	from menu
	
select categoryid, count(*) as [# menu]
	from menu
	group by 
		grouping sets (
			(categoryid), ()
		)
	
/* ---------------------------------------------------------- */
-- Q: หายอดขายแยกตามปี พร้อมผลรวม
select year(intime) year, sum(netpay) revenue
	from OrderHdr
	group by year(intime)
	order by year

select year(intime) year, sum(netpay) revenue
	from OrderHdr
	group by 
		grouping sets (
			year(intime),
			()
		)
	order by year

select year(intime) year, 
		month(intime) month,
		sum(netpay) revenue
	from OrderHdr
	group by 
		grouping sets (
			year(intime),
			month(intime),
			(year(intime), month(intime)),
			()
		)

select year(intime) year, 
		month(intime) month,
		DineTypeID,
		sum(netpay) revenue
	from OrderHdr
	group by 
		grouping sets (
			year(intime),
			(year(intime), month(intime)),
			(year(intime), month(intime), DineTypeID),
			()
		)
