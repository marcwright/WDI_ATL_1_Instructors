CREATE TABLE visited_city(
id serial PRIMARY KEY NOT NULL,
city VARCHAR(50) NOT NULL );

CREATE TABLE journal_entries(
id serial PRIMARY KEY NOT NULL,
title VARCHAR(50) default 'default title',
posting_date VARCHAR(50),
tag VARCHAR(25) REFERENCES visited_city(id),
body_text text,
slug VARCHAR(50) NOT NULL
);
