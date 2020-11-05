use Yummi2012
go

-- เลือกแถวข้อมูลตามเงื่อนไข
-- จำกัดการเข้าถึงข้อมูลบางคอลัมน์ เช่น ต้นทุน
create view vwMenuList
as
select MenuID, a.Descr, a.DescrTH, a.Price, b.Descr as [CategoryName]
	from menu a inner join Category b
		on a.CategoryID = b.CategoryID
go

-- ไม่ควรมี Order by ใน view
-- หากบางคนต้องการเรียงตาม CategoryName ส่วนบางคนต้องการเรียงตาม Price หรือตามชื่อ Menu (Descr)
select * from vwMenuList order by price
select * from vwMenuList order by CategoryName, DescrTh, price

create view vwRevenueByMonth
as
select year(intime) as year, month(intime) as month, sum(NetPay) as revenue
	from OrderHdr
	group by year(intime), month(intime)
go

select * from vwRevenueByMonth order by year, month

select a.month, 
		a.revenue as [2002], 
		b.revenue as [2003], 
		b.revenue - a.revenue as [2003 - 2002], 
		(b.revenue - a.revenue) / a.revenue as [% change]
	from vwRevenueByMonth a 
		inner join vwRevenueByMonth b
		on a.month = b.month
	where a.year = 2002 and b.year = 2003
	order by month

-- ใช้ฟังก์ชัน FORMAT() 
select a.month, 
		format(a.revenue, 'n0') as [2002], 
		format(b.revenue, 'n2') as [2003], 
		b.revenue - a.revenue as [2003 - 2002], 
		format((b.revenue - a.revenue) / a.revenue, 'p2') as [% change]
	from vwRevenueByMonth a 
		inner join vwRevenueByMonth b
		on a.month = b.month
	where a.year = 2002 and b.year = 2003
	order by month
