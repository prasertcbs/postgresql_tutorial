select name, PLATFORM 
	into playstation
	from games where platform = 'PS2'

--select name, PLATFORM 
--	into playstation
--	from games where platform in ('PS3', 'PS4')

insert into playstation(name, platform)
	select name, platform from games where Platform in ('PS3', 'PS4')

-- use Common Table Expression to UNION
;with cte as (
	select name, platform, 'expert' as rater, critic_score as score
		from games
	union
	select name, platform, 'user' as rater, user_score as score
		from games
)
select * 
	into game_score
	from cte
	order by name, platform