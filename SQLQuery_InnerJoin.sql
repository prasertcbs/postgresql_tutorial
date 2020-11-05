select MenuID, Descr, DescrTH, CategoryID
	from menu

select * 
	from Category

-- inner join 2 tables
select MenuID, Menu.Descr, DescrTH, Menu.CategoryID, Category.Descr
	from Menu 
			inner join Category on menu.CategoryID = Category.CategoryID

-- alias table name
select MenuID, m.Descr, DescrTH, m.CategoryID, c.Descr
	from Menu m 
			inner join Category c on m.CategoryID = c.CategoryID

-- inner join 3 tables
select a.OrderID, b.MenuID, c.DescrTH
	from OrderHdr a 
			inner join OrderMenuDtl b on a.OrderID = b.OrderID
			inner join Menu c on b.MenuID = c.MenuID
	where convert(date, intime) = '2002-1-1'

-- distinct
select distinct b.MenuID, c.DescrTH
	from OrderHdr a 
			inner join OrderMenuDtl b on a.OrderID = b.OrderID
			inner join Menu c on b.MenuID = c.MenuID
	where convert(date, intime) = '2002-1-1'

-- inner join + aggregate function
select b.MenuID, c.DescrTH, sum(b.Qty) as [# orders]
	from OrderHdr a 
			inner join OrderMenuDtl b on a.OrderID = b.OrderID
			inner join Menu c on b.MenuID = c.MenuID
	where convert(date, intime) = '2002-1-1'
	group by b.MenuID, c.DescrTH
	order by sum(b.qty) desc