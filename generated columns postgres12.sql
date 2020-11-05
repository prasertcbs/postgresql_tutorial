-- สอน PostgreSQL: การสร้าง GENERATED COLUMNS (สำหรับ PostgreSQL 12+)
-- YouTube: https://youtu.be/cqquHmYaR30
-- Author: Prasert Kanawattanachai
-- email: prasert.k@chula.ac.th

-- ex 1.
drop table if exists product;

create table product (
	id serial,
	price numeric(8, 2),
	cost numeric(8, 2),
	margin numeric(8, 2) generated always as ((price-cost)/price) stored,
	markup numeric(8, 2) generated always as ((price-cost)/cost) stored
);

insert into product(price, cost) values (110, 100), (50, 20);

select * from product;

update product set cost=40 where id=2;
select * from product;

insert into product(price, cost) values (1000, 700), (150, 120); 
select * from product;

-- ex 2.
drop table if exists customer;

create table customer(
	id serial,
	income int,
	income_level varchar generated always as (
		case
			when income > 100000 then 'high'
			when income > 50000 then 'medium'
			else 'low'
		end
	) stored
);

insert into customer(income) values (200000), (12000), (60000);
select * from customer;

update customer set income=300000 where id=3;
select * from customer;