-- create primary key and foreign key
-- server: PostgreSQL
-- YouTube: https://youtu.be/GGyX8xDNamI

-- สร้างตาราง category พร้อมกำหนดให้ category_id เป็น primary key
create table category (
	category_id varchar(2) primary key,
	descr varchar
);

-- สร้างตาราง drinkmenu พร้อมกำหนด primary และ foreign key
create table drinkmenu (
	id int primary key,
	descr varchar,
	category_id varchar(2),
	price int,
	foreign key (category_id) references category(category_id)
);

-- เพิ่มข้อมูลเข้าในตาราง category
insert into category values 
	('cf', 'coffee'),
	('te', 'tea'),
	('ju', 'juice');

select * from category;

-- เพิ่มข้อมูลเข้าในตาราง drinkmenu
insert into drinkmenu values 
	(1, 'mocha', 'cf', 50),
	(2, 'latte', 'cf', 40),
	(3, 'green tea', 'te', 35);
	
select * from drinkmenu;

-- เพิ่มข้อมูลที่มี id ซ้ำกับที่มีอยู่ในตาราง
insert into drinkmenu values 
	(3, 'jasmine tea', 'te', 50);

-- เพิ่มข้อมูล
insert into drinkmenu values 
	(4, 'jasmine tea', 'te', 50);

select * from drinkmenu;

-- เพิ่มข้อมูล category_id โดยยังไม่มีอยู่ในตาราง category
insert into drinkmenu values 
	(5, 'coke', 'sd', 25);

-- เพิ่ม sd (soda) category
insert into category values ('sd', 'soda');

insert into drinkmenu values 
	(5, 'coke', 'sd', 25);

select * from drinkmenu;

-- ex 2. การสร้างตารางโดยระบุ primary key และ foreign key ไว้ข้างท้าย
create table subject (
	subject_id varchar(7),
	descr varchar,
	primary key (subject_id)
);

create table student_grade (
	student_id int,
	subject_id varchar(7),
	grade varchar(2),
	primary key (student_id, subject_id),
	foreign key (subject_id) references subject(subject_id)
);
