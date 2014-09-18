
CREATE TABLE season(
id SERIAL PRIMARY KEY NOT NULL,
season_name VARCHAR(50) NOT NULL,
result_in_marriage? BOOLEAN NOT NULL);

CREATE TABLE episode(
id SERIAL PRIMARY KEY,
title VARCHAR(50) NOT NULL,
date_shot VARCHAR(50) NOT NULL);

CREATE TABLE bachelor(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
which_season INTEGER REFERENCES season(id));

CREATE TABLE woman(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
season INTEGER REFERENCES season(id),
which_episodes INTEGER REFERENCES episode(id));

#this shows if a woman was given a rose on a certain episode(if not == eliminated)
CREATE TABLE romance(
id SERIAL PRIMARY KEY,
bachelor INTEGER REFERENCES bachelor(id),
woman INTEGER REFERENCES woman(id)
episode INTEGER REFERENCES episode(id),
romance BOOLEAN NOT NULL);


