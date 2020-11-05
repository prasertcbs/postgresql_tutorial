select * from DineType

insert into DineType values ('DT', 'Drive-thru')

insert into DineType (DineTypeID, Descr) values ('CT', 'Catering')

insert into DineType (DineTypeID) values ('XX')

insert into DineType (DineTypeID, Descr) values ('TA', 'Type A'), ('TB', 'Type B')

-- สร้างตาราง MonthlyRevenue จากข้อมูลของปี 2002
select year(intime) as year, month(intime) as month, sum(NetPay) as revenue
	into MonthlyRevenue
	from OrderHdr
	where year(intime) = 2002
	group by year(intime), month(intime)

select * from MonthlyRevenue

insert into MonthlyRevenue(year, month, revenue)
	select year(intime) as year, month(intime) as month, sum(NetPay) as revenue
	from OrderHdr
	where year(intime) = 2003
	group by year(intime), month(intime)