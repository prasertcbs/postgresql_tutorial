-- chinook database on PostgreSQL
select album_id, title, album.artist_id, name
	from album inner join artist on album.artist_id = artist.artist_id
	limit 10;
	
select album_id, title, album.artist_id, name
	from album inner join artist using (artist_id)
	limit 5;
	
select album_id, title, album.artist_id, name
	from album natural join artist
	limit 5;