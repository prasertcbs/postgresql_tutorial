-- คุณสมบัติที่ต้องการของงานในตำแหน่งหน้าที่ A = {Word, Excel, PowerPoint, Photoshop}
-- คุณสมบัติของผู้สมัคร B = {Excel, Photoshop}
-- หาว่าผู้สมัครขาดคุณสมบัติใด A left outer join B where B.skill is NULL = {Word, PowerPoint}
-- สร้างตารางเก็บคุณสมบัติที่ต้องการของงานในตำแหน่งหน้าที่
CREATE TABLE [dbo].[ReqSkills](
	[skill] [nvarchar](50) NULL
)
GO

insert into ReqSkills values
	('Word'),
	('Excel'),
	('PowerPoint'),
	('Photoshop')
go

-- สร้างตารางเก็บคุณสมบัติของผู้สมัคร
CREATE TABLE [dbo].[ApplicantSkills](
	[skill] [nvarchar](50) NULL
)
GO
insert into ApplicantSkills values
	('Word'),
	('PowerPoint')
go

select *
	from ReqSkills a left outer join ApplicantSkills b
		on a.skill = b.skill

select *
	from ReqSkills a left outer join ApplicantSkills b
		on a.skill = b.skill
	where b.skill is null