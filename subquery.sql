select * from menu

select avg(price) from menu

select * from menu
	where price > 93.421

select * from menu
	where price > avg(price)

select * from menu
	where price > (select avg(price) from menu)

select MenuID, DescrTH, Price, (select avg(price) from menu) as [avg. price] from menu
	where price > (select avg(price) from menu)
-- 2) หายอดขายแยกตามเดือนของปี 2002 พร้อมกับแสดงว่ายอดขายแต่ละเดือนเป็นกี่เปอร์เซ็นต์ของยอดขายทั้งปี
select month(intime) month, 
		sum(NetPay) as revenue
	from OrderHdr
	where year(intime) = 2002
	group by month(intime)
	order by month

select sum(NetPay)
	from OrderHdr
	where year(intime) = 2002

select month(intime) month, 
		sum(NetPay) as revenue,
		100.0 * sum(NetPay) / (select sum(NetPay)
							from OrderHdr
							where year(intime) = 2002
						) as [% total]
	from OrderHdr
	where year(intime) = 2002
	group by month(intime)
	order by month

-- 3) หายอดขายแยกตามเดือนและประเภทการรับประทานในปี 2002
select month(intime) month, 
		sum(NetPay) as Revenue
	from OrderHdr
	where year(intime) = 2002 and DineTypeID = 'EI'
	group by month(intime)
	order by month

select month(intime) month, 
		sum(NetPay) as Revenue
	from OrderHdr
	where year(intime) = 2002 and DineTypeID = 'TG'
	group by month(intime)
	order by month

select ei.month, ei.Revenue as [Eat-in], tg.Revenue as [To go]
	from 
	(
		select month(intime) month, 
				sum(NetPay) as Revenue
			from OrderHdr
			where year(intime) = 2002 and DineTypeID = 'EI'
			group by month(intime)
	) ei
	inner join
	(
		select month(intime) month, 
				sum(NetPay) as Revenue
			from OrderHdr
			where year(intime) = 2002 and DineTypeID = 'TG'
			group by month(intime)
	) tg
	on ei.month = tg.month
	order by ei.month