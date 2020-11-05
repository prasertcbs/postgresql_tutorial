select value from string_split('Action,Crime,Drama,Triller', ',')

select movieid, value as genre 
	from movie cross apply string_split(genres, '|')

;with cte as (
	select movieid, value as genre 
		from movie cross apply string_split(genres, '|')
)
select genre, count(*) as [# of movies]
	from cte
	group by genre
	order by count(*) desc;

select value as genre, count(*) [# of movies]
	from movie cross apply string_split(genres, '|')
	group by value
	order by count(*) desc;

select movie_title, genres
	from movie
	where 'Drama' in (select value from string_split(genres, '|'))
