
CREATE TABLE skater(
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) default "nationality: none");


CREATE TABLE judge(
id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
nationality VARCHAR(50) default "nationality: none");


CREATE TABLE score(
id SERIAL PRIMARY KEY,
score INTEGER NOT NULL,
by_judge INTEGER REFERENCES judge(id),
for_skater INTEGER REFERENCES skater(id));


