
-- การสุ่มแถวจากตาราง
select *
	from OrderHdr

select *
	from OrderHdr
	tablesample (100 rows)

select top 50 *
	from OrderHdr
	tablesample (100 rows)

select *
	from OrderHdr
	tablesample (10 percent)

-- newid() ส่งค่ากลับมาเป็น unique identifier ขนาด 16 bytes (2 ^ 128 ~ 3 ตามด้วย 0 อีก 38 ตัว)
select newid()

select OrderID, newid()
    from OrderHdr

-- 1) simple random sampling
-- สุ่มเลือก 10 แถว
select top (5) percent OrderID
    from OrderHdr
    order by newid()

-- 2) stratified sampling
-- แบ่งเป็น quartile แยกตาม NetPay
-- row_number() partition by ntile order by newid
-- select top (n) [percent]
;with cte as
(
    select OrderID,
            ntile(4) 
                over (
                        order by NetPay desc
                     ) quartile
        from OrderHdr
),
cte2 as
(
    select OrderID, quartile,
            row_number() 
                over (
                        partition by quartile 
                        order by newid()
                     ) as [row #]
    from cte
)
select top (10) percent * -- เลือก 10% ของแถวจากแต่ละ quartile 
    from cte2
    order by [row #]



-- 3) Cluster sampling (มักจะแบ่งกลุ่ม (cluster) ด้วยเวลา เช่น เดือน หรือที่ตั้ง เช่น จังหวัด)
-- เช่น สุ่ม 5 แถวของข้อมูลจากแต่ละเดือนในแต่ละปี
;with cte as
(
    select OrderID, intime,
            row_number() 
                over (
                        partition by year(intime), month(intime)
                        order by newid()
                     ) [row #]
        from OrderHdr
)
select * 
    from cte
    where [row #] <= 5