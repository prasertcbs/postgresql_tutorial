select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join Menu b on a.MenuID = b.MenuID
	where OrderId =1
union
select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join Menu b on a.MenuID = b.MenuID
	where OrderId =2
union
select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join Menu b on a.MenuID = b.MenuID
	where OrderId =3

select N'วันเสาร์อาทิตย์', sum(NetPay)
	from OrderHdr
	where datepart(weekday, intime) in (1, 7)
union
select N'วันธรรมดา', sum(NetPay)
	from OrderHdr
	where datepart(weekday, intime) not in (1, 7)
union
select N'รวม', sum(NetPay)
	from OrderHdr

select N'1. วันเสาร์อาทิตย์' as [period], sum(NetPay)
	from OrderHdr
	where datepart(weekday, intime) in (1, 7)
union
select N'2. วันธรรมดา' as [period], sum(NetPay)
	from OrderHdr
	where datepart(weekday, intime) not in (1, 7)
union
select N'3. รวม' as [period], sum(NetPay)
	from OrderHdr
	order by period
