select * 
into TestCategory
from Category

select * from TestCategory

delete TestCategory
	where CategoryID = 'AP'

delete TestCategory

-- REFERENCE constraint ระหว่าง OrderHdr กับ OrderMenuDtl
select * from OrderHdr
	where OrderID in (1, 2, 3)

select * from OrderMenuDtl
	where OrderID in (1, 2, 3)

delete OrderMenuDtl
	where OrderID in (1, 2, 3)

delete OrderHdr
	where OrderID in (1, 2, 3)

select * from OrderHdr
	where OrderID in (1, 2, 3)

select * from OrderMenuDtl
	where OrderID in (1, 2, 3)

select * from OrderHdr
	where OrderID in (4, 5, 6)

select * from OrderMenuDtl
	where OrderID in (4, 5, 6)

delete OrderHdr
	where OrderID in (4, 5, 6)

delete OrderMenuDtl
	where OrderID in (4, 5, 6)

sp_changedbowner 'sa'

-- แสดงรายการที่ลูค้าเป็นชาวอังกฤษ
select OrderHdr.*
     FROM Customer INNER JOIN OrderHdr
     ON Customer.CustomerID = OrderHdr.CustomerID
     WHERE CountryID = 'UK'

delete OrderHdr
     FROM Customer INNER JOIN OrderHdr
     ON Customer.CustomerID = OrderHdr.CustomerID
     WHERE CountryID = 'UK'

