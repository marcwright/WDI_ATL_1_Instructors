# SQL Clauses & Aggregation
<<<<<<< HEAD
=======
# Stephen Stanwood (stephen@stanwoodsolutions.com)
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453

### Part 1

Fire up psql and create a database called `nba_db`.

I've created the schema for a table called `players` in the file `players.sql`. The schema includes an id, name, age, team, games, and points.

Run the `players.sql` file for your `nba_db` by typing`psql -d nba_db -f players.sql` into your terminal (not in psql). This will create the players table in your nba_db.

### Part 2

Run `gem install pg` to install the pg gem. The pg gem allows us to run SQL in a Ruby file.

Run the `load_data.rb` Ruby program __ONCE__ to populate the database. It reads in the CSV information from the `data.csv` textfile and populates your database. The data is structured like the following:`name,age,team,games,points`

** `games` is games played during the season and `points` is total points scored over the course of the season.

### Part 3

Figure out the appropriate SQL commands to find out the following, and keep track of them in the file called `sql_commands.txt`

1. All columns for all players from the New York Knicks (NYK)
<<<<<<< HEAD
2. All columns for all players from the Indiana Packers (IND) who are under 26 years old
3. All columns for all players, ordered from least points scored to most points scored
4. Name and Points per game (points/games), for the players with the top 20 points per game
5. The average age for all players
6. The average age for all players on the Oklahoma City Thunder (OKC)
7. The average age for all players who played more than 40 games
8. The team and total points scored from all players on that team (team points), ordered from most team points to least

###Bonus
1. Age and the average points per game for that age, ordered from youngest to oldest
2. Team and the the number of players who score above 12 points per game on that team, ordered from most to least
=======

  SELECT *
  FROM players
  WHERE team = 'NYK';

2. All columns for all players from the Indiana Packers (IND) who are under 26 years old

  SELECT *
  FROM players
  WHERE team = 'IND' AND age < 26;


3. All columns for all players, ordered from least points scored to most points scored

  SELECT *
  FROM players
  ORDER BY points;

4. Name and Points per game (points/games), for the players with the top 20 points per game

  SELECT name, (points / games) AS PPG
  FROM players
  ORDER BY PPG DESC
  LIMIT 20;

5. The average age for all players

  SELECT AVG(age)
  FROM players;

6. The average age for all players on the Oklahoma City Thunder (OKC)

  SELECT AVG(age)
  FROM players
  WHERE team = 'OKC';

7. The average age for all players who played more than 40 games

  SELECT AVG(age)
  FROM players
  WHERE games > 40;

8. The team and total points scored from all players on that team (team points), ordered from most team points to least

  SELECT team, SUM(points) AS TeamPoints
  FROM players
  GROUP BY team
  ORDER BY TeamPoints DESC;

###Bonus
1. Age and the average points per game for that age, ordered from youngest to oldest

  SELECT age, AVG(points)
  FROM players
  GROUP BY age
  ORDER BY age;

2. Team and the the number of players who score above 12 points per game on that team, ordered from most to least

  SELECT team, COUNT(players) AS Scorers
  FROM players
  WHERE (points / games) > 12
  GROUP BY team
  ORDER BY Scorers DESC;
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453
