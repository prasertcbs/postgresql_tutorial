-- date/time function

select *
	from OrderHdr

select *
	from OrderHdr 
	where intime = '2002-01-1'

select *
	from OrderHdr 
	where year(intime) = 2002 and
		  month(intime) = 1 and 
		  day(intime) = 1

-- แสดงการใช้ฟังก์ชัน convert เพื่อเอาเฉพาะส่วนของวันที่
select *
	from OrderHdr 
	where convert(date, intime) = '2002-1-1'

-- ยอดขายในวันที่ 2002-2-14 
select convert(date, intime), sum(netpay)
	from OrderHdr 
	where convert(date, intime) = '2002-2-14'
	group by convert(date, intime)

-- ลูกค้าเข้ามารับประทานอาหารในช่วงเวลาใด
select datepart(hour, intime) as hour, 
	   count(orderid) as [# customers]
	from OrderHdr
	where year(intime) = 2002
	group by datepart(hour, intime)
	order by hour

-- ลูกค้าเข้ามารับประทานอาหารในช่วงเวลาใด
-- แสดงการใช้ concat เพื่อสร้าง period
select concat(datepart(hour, intime), ':00 - ', datepart(hour, intime), ':59') as period,
	   count(orderid) as [# customers]
	from OrderHdr
	where year(intime) = 2002
	group by concat(datepart(hour, intime), ':00 - ', datepart(hour, intime), ':59')
	order by period

-- เวลาเฉลี่ย (นาที) ที่ลูกค้าแต่ละโต๊ะใช้ แยกตามไตรมาส
select datepart(quarter, intime) as quarter, avg(datediff(minute, intime, outtime)) as [avg. minutes]
	from OrderHdr
	where year(intime) = 2003
	group by datepart(quarter, intime)
	order by datepart(quarter, intime)

-- วันใดในเดือน มกราคม 2002 มี NetPay สูงสุด
select top (1) with ties convert(date, intime) as date, sum(netpay) as netpay
	from OrderHdr
	where year(intime) = 2002 and month(intime) = 1
	group by convert(date, intime)
	order by sum(netpay) desc

-- วันใดในเดือน มกราคม 2002 มี NetPay ต่ำสุด
select top (1) with ties convert(date, intime) as date, sum(netpay) as netpay
	from OrderHdr
	where year(intime) = 2002 and month(intime) = 1
	group by convert(date, intime)
	order by sum(netpay)

-- top n percent
select top (10) percent with ties convert(date, intime) as date, sum(netpay) as netpay
	from OrderHdr
	where year(intime) = 2002 and month(intime) = 1
	group by convert(date, intime)
	order by sum(netpay) desc