CREATE TABLE skaters (
id serial PRIMARY KEY,
name VARCHAR(50) NOT NULL,
rank integer(4)
);

CREATE TABLE judges (
id serial PRIMARY KEY,
judge_name VARCHAR(50) NOT NULL
);

CREATE TABLE events (
id serial PRIMARY KEY,
skate_date date NOT NULL,
name_id REFERENCES skaters (id) NOT NULL,
judge_id REFERENCES judges (id) NOT NULL,
avg_score integer
);
