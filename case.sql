-- CASE ... END 
-- http://technet.microsoft.com/en-us/library/ms181765.aspx
/* --------------------------------------------------------------- */
-- Q: แสดงคำนำหน้าชื่อ
-- Syntax 1: [column name] = case ... end 
select * from Customer

select CustomerID, FName, LName, Gender,
		 title= case Gender
					when 'F' then 'Ms.'
					when 'M' then 'Mr.'
				end
	from Customer

select CustomerID, FName, LName, Gender,
		case 
			when Gender = 'F' then 'Ms.'
			when Gender = 'M' then 'Mr.'
		end as title
	from Customer

/* --------------------------------------------------------------- */
-- Q: แยกอาหารออกเป็น ปลา ผัก และอื่นๆ 
select * from menu

select MenuID, DescrTH,
	case
		when DescrTH like N'%ปลา%' then N'ปลา'
		when DescrTH like N'%ผัก%' then N'ผัก'
		else N'อื่นๆ'
	end as [menu type]
	from menu



/* --------------------------------------------------------------- */
-- Q: แบ่งตามมื้ออาหาร
select * from OrderHdr

select intime,
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end as [dine_time]
	from OrderHdr

select 
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end as [dine_time],
		count(orderid) as [# orders]
	from OrderHdr
	group by 
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end
union
select 'total', count(orderid) from OrderHdr


select 
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end as [dine_time],
		count(orderid) as [# orders]
	from OrderHdr
	where
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end in ('breakfast', 'dinner')
	group by 
		case
			when datepart(hour, intime) between 6 and 10 then 'breakfast'
			when datepart(hour, intime) between 11 and 14 then 'lunch'
			when datepart(hour, intime) between 17 and 24 then 'dinner'
		end


















