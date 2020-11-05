select count(*) 
	from customer

-- count(*) vs count(column_name)
select count(*), count(fname), count(tel) from customer

-- understand NULL
select count(*) 
	from customer
	where tel is not null

-- simple aggregate function
select count(*), min(price), max(price), avg(price) from menu

-- alias column name
select count(*) as [# menu], 
	   min(price) as [min price], 
	   max(price) as [max price], 
	   avg(price) as [avg. price]
	from menu

select count(*) as [# menu]
	from menu
	group by categoryid

-- column in group by
select categoryid, count(*) as [# menu]
	from menu
	group by categoryid

-- where vs having
select categoryid, 
		count(*) as [# menu], 
		avg(price) as [avg. price]
	from menu
	where price > 100
	group by categoryid

-- where vs having
select categoryid, 
		count(*) as [# menu], 
		avg(price) as [avg. price]
	from menu
	group by categoryid
	having avg(price) > 100

select sum(NetPay), avg(NetPay) from orderhdr

select sum(NetPay) 
	from orderhdr
	where year(intime) = 2002 and month(intime) = 1

select year(intime), month(intime), sum(NetPay), avg(NetPay) 
	from orderhdr
	group by year(intime), month(intime)
	order by year(intime), month(intime)