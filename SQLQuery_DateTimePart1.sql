select getdate() -- GETDATE() วันและเวลาปัจจุบัน

select CONVERT(date, getdate()) -- เอาเฉพาะส่วนของวันที่
select CONVERT(time, getdate()) -- เอาเฉพาะส่วนที่เป็นเวลา

select getdate(), 
		year(getdate()) as year, 
		month(getdate()) as month, 
		day(getdate()) as date

-- int DATEPART
-- see http://msdn.microsoft.com/en-us/library/ms174420.aspx
select getdate() as now,
		datepart(year, getdate()) as year,
		datepart(month, getdate()) as month,
		datename(m, getdate()) as [month name],
		datepart(day, getdate()) as day,
		datepart(dw, getdate()) as [week day], -- sunday = 1, monday = 2
		datename(dw, getdate()) as [week day name],
		datepart(dy, getdate()) as [day of year],-- วันที่เท่าไรของปี
		datepart(quarter, getdate()) as quarter,
		datepart(hour, getdate()) as hour,
		datepart(minute, getdate()) as minute,
		datepart(second, getdate()) as second

select getdate(), 
		dateadd(d, 5, getdate()),
		dateadd(d, -2, '2014-5-31')

select datediff(day, '1995-7-28', getdate())

select datediff(year, '1995-7-28', getdate()),
		datediff(month, '1995-7-28', getdate()),
		datediff(day, '1995-7-28', getdate())
