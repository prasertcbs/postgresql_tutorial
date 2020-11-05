select * from menu
a
update menu
	set Descr = 'Special Red Wine'
	where Descr = 'Red Wine'

update menu
	set DescrTH = N'ไวน์แดงพิเศษ',
		Price = 120
	where MenuID = '310S8'

update Menu
	set price = price * 1.1

update Menu
	set price = price / 1.1

update Menu
	set price = price * 1.1
	where CategoryID = 'AP'

update Menu
	set price = price * 1.2
	where CategoryID = 'BE'

update Menu
	set price = price * 1.3
	where CategoryID = 'DI'

update Menu
	set price = price *
		case
			when CategoryID = 'AP' then 1.1
			when CategoryID = 'BE' then 1.2
			when CategoryID = 'DI' then 1.3
			else 1
		end

select * from OrderHdr
select * from OrderMenuDtl

select a.OrderID, sum(a.Qty * b.Price) as Total
	from OrderMenuDtl a
		inner join Menu b
			on a.MenuID = b.MenuID
	group by a.OrderID

update OrderHdr
	set Total = 0

create view vwTotalByOrder
as
	select a.OrderID, sum(a.Qty * b.Price) as Total
		from OrderMenuDtl a
			inner join Menu b
				on a.MenuID = b.MenuID
		group by a.OrderID
go

select * from vwTotalByOrder

update a
	set a.Total = b.Total
	from OrderHdr a
		inner join vwTotalByOrder b
			on a.OrderID = b.OrderID