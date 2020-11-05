
-- ใช้ FORMAT() SQL 2012+
-- ดูรายละเอียด Standard numeric format string 
-- http://msdn.microsoft.com/library/dwhawy9k.aspx
-- http://msdn.microsoft.com/en-us/library/0c899ak8.aspx

-- culture code
-- http://msdn.microsoft.com/en-US/library/ee825488(v=cs.20).aspx

-- Date/Time format
-- http://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx

select year(intime) year, month(intime) month, 
		format(intime, 'MMM', 'th') [month th],
		sum(netpay) as revenue,
		format(sum(netpay), 'C', 'th') as [currency fmt]
	from OrderHdr
	group by year(intime), month(intime), format(intime, 'MMM', 'th')
	order by year, month







select
    1000.45 as [raw],
	format(1000.45, 'G') as [general],
    format(1000.45, 'G', 'de') as [German-general],
	format(1000.45, 'C', 'de') as [German-currency],
	format(1000.45, 'C3', 'th') as [Thai-currency]

select
    12345678.45 as [raw],
	format(12345678.45, 'n0') as [n0],
	format(12345678.45, 'n2') as [n2],
	format(12345678.45, '#,##0.00') as [#,##0.00],
	format(12345678.45, N'#,##0,พัน') as [#,##0,k],
	format(12345678.45, '#,##0,,m') as [#,##0,,m],
	format(12345678.45, '#,##0,,mil') as [#,##0,,mil],
	format(12345678.45, '#,##0,,.00m') as [#,##0,,.00m],
	format(12345678.45, N'#,##0,,.00ล้าน') as [#,##0,,.00ล้าน]

-- with Currency code
select
    12345678.45 as [raw],
	format(12345678.45, 'C') as [system default],
    format(12345678.45, 'C', 'th') as [Thai],
    format(12345678.45, 'C', 'ja') as [Japan],
    format(12345678.45, 'C', 'de') as [German],
	format(12345678.45, 'C', 'en-GB') as [Great Britain],
    format(12345678.45, 'C', 'en-US') as [US]

-- 0 vs #
select
    format(.45, '#.00') as [#.00],
    format(.45, '0.00') as [0.00],
    format(21, '0000') as [0000],
    format(1, '####') as [####]

-- percent
select
	format(.1234, 'p0') as [p0],
	format(.1234, 'p1') as [p1],
	format(.1234, 'p2') as [p2],
	format(.1234, '0.00%') as [0.00%],
	format(.0034, '0.00%') as [0.00%],
	format(.0034, '#.00%') as [#.00%]

-- date
select
	format(getdate(), 'D') as [D],
	format(getdate(), 'd') as [d],
	format(getdate(), 'ddd') as [ddd],
	format(getdate(), 'MMM') as [MMM],
	format(getdate(), 'dd-M-yy') as [dd-M-yy],
	format(getdate(), 'dd-MM-yy') as [dd-MM-yy],
	format(getdate(), 'dd MMM yy') as [dd MMM yy],
	format(getdate(), 'ddd dd-MMM-yyyy') as [ddd dd-MMM-yyyy],
	format(getdate(), 'dddd dd MMMM yyyy') as [dddd dd MMMM yyyy]

-- date with culture/sub-culture
select
	format(getdate(), 'D', 'en-GB') as [D],
	format(getdate(), 'D', 'en-US') as [D],
	format(getdate(), 'd', 'en-US') as [d],
	format(getdate(), 'ddd', 'en-US') as [ddd],
	format(getdate(), 'dddd', 'en-US') as [dddd],
	format(getdate(), 'MMM', 'en-US') as [MMM],
	format(getdate(), 'MMMM', 'en-US') as [MMMM],
	format(getdate(), 'dd-M-yy', 'en-US') as [dd-M-yy],
	format(getdate(), 'dd-MM-yy', 'en-US') as [dd-MM-yy],
	format(getdate(), 'dd MMM yy', 'en-US') as [dd MMM yy],
	format(getdate(), 'ddd dd-MMM-yyyy', 'en-US') as [ddd dd-MMM-yyyy],
	format(getdate(), 'dddd dd MMMM yyyy', 'en-US') as [dddd dd MMMM yyyy]

-- time
select
    format(cast('2014-2-6 19:20' as datetime), 'dd-MMM-yyyy HH:mm') as [dd-MMM-yyyy HH:mm],
    format(cast('2014-2-6 19:20' as datetime), 'hh:mm') as [hh:mm],
    format(cast('2014-2-6 19:20' as datetime), 'hh:mm tt') as [AM/PM],
    format(cast('2014-2-6 19:20' as datetime), 'HH:mm') as [HH:mm 24-hour],
    format(cast('2014-2-6 19:20' as datetime), 'HH:mm zz') as [HH:mm zz], -- UTC (Universal Time Coordinated) ว่าห่างจาก Greenwich Mean Time (GMT) กี่ชั่วโมง
    format(cast('2014-2-6 19:20' as datetime), 'HH:mm zzz') as [HH:mm zzz] -- UTC (Universal Time Coordinated) ว่าห่างจาก Greenwich Mean Time (GMT) กี่ชั่วโมง กี่นาที

-- date with thai culture
select
	format(getdate(), 'D', 'th') as [D],
	format(getdate(), 'd', 'th') as [d],
	format(getdate(), 'ddd', 'th') as [ddd],
	format(getdate(), 'dddd', 'th') as [dddd],
	format(getdate(), 'MMM', 'th') as [MMM],
	format(getdate(), 'MMMM', 'th') as [MMMM],
	format(getdate(), 'dd-M-yy', 'th') as [dd-M-yy],
	format(getdate(), 'dd-MM-yy', 'th') as [dd-MM-yy],
	format(getdate(), 'dd MMM yy', 'th') as [dd MMM yy],
	format(getdate(), 'ddd dd-MMM-yyyy', 'th') as [ddd dd-MMM-yyyy],
	format(getdate(), 'dddd dd MMMM yyyy', 'th') as [dddd dd MMMM yyyy]

-- date with Japanese culture
select
	format(getdate(), 'D', 'ja') as [D],
	format(getdate(), 'd', 'ja') as [d],
	format(getdate(), 'ddd', 'ja') as [ddd],
	format(getdate(), 'MMM', 'ja') as [MMM],
	format(getdate(), 'dd-M-yy', 'ja') as [dd-M-yy],
	format(getdate(), 'dd-MM-yy', 'ja') as [dd-MM-yy],
	format(getdate(), 'dd MMM yy', 'ja') as [dd MMM yy],
	format(getdate(), 'ddd dd-MMM-yyyy', 'ja') as [ddd dd-MMM-yyyy],
	format(getdate(), 'dddd dd MMMM yyyy', 'ja') as [dddd dd MMMM yyyy]