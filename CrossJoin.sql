/*
CROSS JOIN เป็นการเชื่อมตารางสองตารางเข้าด้วยกันโดยข้อมูลทุกแถวของตารางแรกมาเชื่อมกับข้อมูลทุกแถวในตารางที่สอง 
หรืออาจมองว่าเป็นการจับคู่กันของทุกแถวของตารางทั้งสองก็ได้ (ในกรณีไม่มีการระบุเงื่อนไขภายใต้ WHERE) 
ซึ่งการทำ cross join นั้นผลที่ได้จะอยู่ในรูปของผลคูณคาร์ทีเซียน (Cartesian product) 
ของแถวที่เกิดจากตารางทั้งสอง 
ดังนั้นหากตารางแรกมี 4 แถว และตารางที่สองมี 13 แถว การทำ cross join 
จะได้ผลลัพธ์ทั้งสิ้น 4 x 13 = 52 แถว

การประยุกต์ใช้ cross join นั้นจะเหมาะสำหรับปัญหาในลักษณะที่ต้องการนำค่าจากตาราง 2 ตารางมาใช้ร่วมกัน 
แต่ตารางทั้ง 2 นั้นไม่มีคอลัมน์ร่วมที่จะใช้เชื่อมกันได้
*/

select *
	from Ranks cross join Suits

select *
	into Deck
	from Ranks cross join Suits

-- หารายได้แยกตามเดือนของปี 2002
select month(intime) as [month], 
		sum(Netpay) as revenue
	from OrderHdr
	where year(intime) = 2002
	group by month(intime)
	order by [month]

-- ตาราง OrderHdr และ ตาราง Parameter ไม่มี common column เพื่อทำการ inner/outer join
-- ตาราง parameter ใช้สำหรับเก็บค่าที่ใช้ร่วมกันในหลายตาราง เช่น ขนาดพื้นที่ร้าน อัตราภาษีมูลค่าเพิ่ม ที่ตั้งร้าน เบอร์โทรศัพท์ ฯลฯ
-- หารายได้เฉลี่ยต่อพื้นที่ในหนึ่งเดือน
select month(intime) as [month], 
		sum(Netpay) revenue,
		b.Area,
		sum(Netpay) / b.Area [revenue per sq.m]
	from OrderHdr a cross join Parameter b
	where year(intime) = 2002
	group by month(intime), b.Area
	order by [month]



