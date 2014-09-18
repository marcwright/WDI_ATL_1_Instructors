-- Figure out the appropriate SQL commands to find out the following, and keep track of them in the file called `sql_commands.txt`

-- 1. All columns for all players from the New York Knicks (NYK)
select * from players
where team = 'NYK';

-- 2. All columns for all players from the Indiana Packers (IND) who are under 26 years old
select * from players
where team = 'IND' and age < 26;

-- 3. All columns for all players, ordered from least points scored to most points scored
select * from players
order by points asc;

-- 4. Name and Points per game (points/games), for the players with the top 20 points per game
select
  name,
  points/games as "ppg"
from players;

-- 5. The average age for all players
select
  avg(age) as "average_age"
from players;

-- 6. The average age for all players on the Oklahoma City Thunder (OKC)
select
  avg(age) as "average_age"
from players
where team = 'OKC';

-- 7. The average age for all players who played more than 40 games
select
  avg(age) as "average_age"
from players
where games > 40;

-- 8. The team and total points scored from all players on that team (team points), ordered from most team points to least
select
  team,
  sum(points) as "team_points"
from players
group by team
order by team_points desc;

-- ###Bonus
-- 1. Age and the average points per game for that age, ordered from youngest to oldest
select
  age,
  sum(cast(points as float))/sum(games) as "avg_ppg"
from players
group by age
order by age asc;

-- 2. Team and the the number of players who score above 12 points per game on that team, ordered from most to least
select
  team,
  count(*) as "num_12_ppg_players"
from players
where points/games > 12
group by team
order by num_12_ppg_players desc;
