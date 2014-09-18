CREATE TABLE seasons(
id serial PRIMARY KEY,
season_number INTEGER NOT NULL,
marriage BOOLEAN DEFAULT 'false',
);

CREATE TABLE contestants(
id serial PRIMARY KEY,
first_name VARCHAR(42) NOT NULL,
last_name VARCHAR(42) NOT NULL,
occupation VARCHAR(42) NOT NULL,
age INTEGER NOT NULL,
gender VARCHAR(1) NOT NULL,
last_episode INTEGER NOT NULL
);

CREATE TABLE episodes(
id serial PRIMARY KEY,
episode_num INTEGER NOT NULL
);

CREATE TABLE contestants_episodes(
id serial PRIMARY KEY,
contestant_id REFERENCE contestants(id) NOT NULL,
episode_id REFERENCE episodes(id) NOT NULL
);
