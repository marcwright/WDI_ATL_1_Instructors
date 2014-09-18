CREATE TABLE episodes(
id serial PRIMARY KEY,
name INTEGER NOT NULL
);

CREATE TABLE chefs(
id serial PRIMARY KEY,
name VARCHAR(42) NOT NULL,
age INTEGER NOT NULL,
home_town VARCHAR(42) NOT NULL,
fav_food VARCHAR(42) NOT NULL,
chopped BOOLEAN DEFAULT 'false'
);

CREATE TABLE rounds(
id serial PRIMARY KEY,
round_num INTEGER NOT NULL,
episode_id INTEGER references episodes(id)
);

CREATE TABLE dishes(
id serial PRIMARY KEY,
dish_name VARCHAR(42) NOT NULL,
round_id INTEGER references rounds(id),
chef_id INTEGER references chefs(id)
);

CREATE TABLE judges(
id serial PRIMARY KEY,
name VARCHAR(42) NOT NULL,
age INTEGER NOT NULL,
fav_food VARCHAR(42) NOT NULL
);

CREATE TABLE scores(
id serial PRIMARY KEY,
score_value INTEGER NOT NULL,
dish_id INTEGER references dishes(id),
judge_id INTEGER references judges(id)
);

CREATE TABLE appearances(
id serial PRIMARY KEY,
episode_id INTEGER references episodes(id),
judge_id INTEGER references judges(id)
);
