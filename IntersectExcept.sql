-- intersect
-- เมนูที่ลูกค้าโต๊ะที่ (OrderID) 1, 2 และ 3 สั่งเหมือนกัน
select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join menu b on a.MenuID = b.MenuID
	where OrderID = 1
intersect
select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join menu b on a.MenuID = b.MenuID
	where OrderID = 2
intersect
select a.MenuID, b.DescrTH
	from OrderMenuDtl a inner join menu b on a.MenuID = b.MenuID
	where OrderID = 3


-- except
-- ลูกค้าที่ไม่ได้เข้ามาใช้บริการในช่วงวันที่ 2002-1-1 ถึง 2002-1-7
select CustomerID, FName
	from Customer
except
select a.CustomerID, b.FName
	from OrderHdr a inner join Customer b on a.CustomerID = b.CustomerID
	where convert(date, InTime) between '2002-1-1' and '2002-1-7'

-- เมนูที่ไม่มีลูกค้ารายใดสั่งเลยในวันที่ 2002-1-1
select MenuID, DescrTH
	from Menu
except
select b.MenuID, c.DescrTH
	from OrderHdr a inner join OrderMenuDtl b on a.OrderID = b.OrderID inner join
	Menu c on b.MenuID = c.MenuID
	where convert(date, intime) = '2002-1-1'