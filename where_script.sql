select * from menu where price >=50 and price <= 100
select * from menu where price between 50 and 100

select * from menu where CategoryID = 'be' or CategoryID = 'de'

select * from menu where CategoryID not in('be', 'de')

select * from menu where descr like '%chicken%'

select * from menu where descrth like N'%ไก่%' -- N = National -> Unicode
select * from menu where descrth like N'ไก่%' -- ขึ้นต้นด้วยคำว่า ไก่
select * from menu where descrth like N'%ไก่' -- ลงท้ายด้วยคำว่า ไก่

select * from menu where descr like '_r%'
select * from menu where descr like '__r%'

select * from menu where descr like '[TGP]%' ขึ้นต้นด้วยตัว T หรือ G หรือ P
select * from menu where descr like '[^TGP]%' ไม่ขึ้นต้นด้วยตัว T หรือ G หรือ P