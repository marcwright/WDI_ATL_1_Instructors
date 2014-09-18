CREATE TABLE seasons (
id serial PRIMARY KEY,
season_year INTEGER(4) NOT NULL,
episode_num INTEGER(2) NOT NULL,
episode_date DATE,
got_married BOOLEAN NULL,
);

CREATE TABLE contestants(
first_name varchar(50),
last_name varchar(50),
age INTEGER(3),
created_date DATE,
deleted_date DATE,
elimination_episode INTEGER(10)
);

CREATE TABLE contestants_seasons (
contestant_id INTEGER REFERENCES contestants (id) NOT NULL,
episode_id INTEGER REFERENCES episodes (id) NOT NULL,
);
