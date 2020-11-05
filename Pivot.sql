-- pivot table (crosstab style)
-- http://technet.microsoft.com/en-us/library/ms177410%28v=sql.105%29.aspx

-- 1.1) pivot by year
select year(intime) year, month(intime) month, sum(NetPay) revenue
	from OrderHdr
	group by year(intime), month(intime)
	order by year, month

SELECT  Month, [2002], [2003], [2003] - [2002] as [diff 2003-2002]
	FROM  (
			select year(intime) year, month(intime) month, sum(NetPay) revenue
				from OrderHdr
				group by year(intime), month(intime)
		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR Year IN ([2002], [2003])
		  ) AS pvt
	ORDER BY month

-- Add column [2003] - [2002] AS [Revenue (2003-2002)]
SELECT  Month, [2002], [2003], [2003] - [2002] AS [Revenue (2003-2002)]
	FROM  (
			select year(intime) year, month(intime) month, sum(NetPay) revenue
				from OrderHdr
				group by year(intime), month(intime)
		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR Year IN ([2002], [2003])
		  ) AS pvt
	ORDER BY month

-- 1.2) pivot by month
SELECT  Year, [1], [2], [3], [4], [5], [6]
	FROM  (
			select year(intime) year, month(intime) month, sum(NetPay) revenue
				from OrderHdr
				where year(intime) in (2003, 2002)
				group by year(intime), month(intime)
		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR month IN ([1], [2], [3], [4], [5], [6])
		  ) AS pvt
	ORDER BY year

-- 1.3) pivot by quarter
select year(intime) year, datepart(q, intime) quarter, sum(NetPay) revenue
	from OrderHdr
	group by year(intime), datepart(q, intime)

SELECT  Year, [1] as [Q1], [2] as [Q2], [3] as [Q3], [4] as [Q4], [1] + [2] + [3] + [4] as [total]
	FROM  (
			select year(intime) year, datepart(q, intime) quarter, sum(NetPay) revenue
				from OrderHdr
				where year(intime) in (2002, 2003)
				group by year(intime), datepart(q, intime)

		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR quarter IN ([1], [2], [3], [4])
		  ) AS pvt
	ORDER BY year


-- 2) add DineTypeID
select year(intime) year, month(intime) month, DineTypeID, sum(NetPay) revenue
	from OrderHdr
	group by year(intime), month(intime), DineTypeID

-- Pivot by Year
SELECT  Month, DineTypeID, [2002], [2003], [2003] - [2002] AS [Revenue (2003-2002)]
	FROM  (
			select year(intime) year, month(intime) month, DineTypeID, sum(NetPay) revenue
				from OrderHdr
				group by year(intime), month(intime), DineTypeID
		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR Year IN ([2002], [2003])
		  ) AS pvt
	ORDER BY DineTypeID, month

-- pivot by DineTypeID
SELECT  Year, Month, [EI] as [Eat in], [TG] as [To go], [EI] + [TG] as [total]
	FROM  (
			select year(intime) year, month(intime) month, DineTypeID, sum(NetPay) revenue
				from OrderHdr
				group by year(intime), month(intime), DineTypeID
		  ) d
	PIVOT (
			SUM(Revenue) 
			FOR DineTypeID IN ([EI], [TG])
		  ) AS pvt
	ORDER BY year, month
