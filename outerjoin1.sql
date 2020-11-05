/*
inner join เป็นการเชื่อมแถวระหว่างตาราง โดยผลลัพธ์ที่ได้จะเป็นแถวที่มีค่าของ common column ที่ตรงกัน 
หรือ matching rows เช่น Menu.CategoryID = Category.CategoryID

ส่วน outer join  จะเป็นการเชื่อมที่สามารถจะแสดงทั้งแถวที่มีค่า common column ตรงกัน 
หรือ mathing rows และแถวที่ไม่ non-matching rows
outer join จะแสดงแถวของตารางที่เชื่อมกันโดยจะแสดงทุกแถวตามเงื่อนไขที่กำหนดออกมา 
แม้ว่าแถวนั้นจะไม่มีค่าที่ตรง  non-matching rows กับแถวในอีกตารางหนึ่งก็ตาม
*/

select MenuID, DescrTH, b.CategoryID, a.Descr
	from Category a inner join Menu b
		on a.CategoryID = b.CategoryID

select * from Category

select MenuID, DescrTH, b.CategoryID, a.Descr
	from Category a left outer join Menu b
		on a.CategoryID = b.CategoryID

select MenuID, DescrTH, b.CategoryID, a.Descr
	from Category a right outer join Menu b
		on a.CategoryID = b.CategoryID

select MenuID, DescrTH, b.CategoryID, a.Descr
	from Menu b right outer join Category a
		on a.CategoryID = b.CategoryID
	where b.CategoryID is null
