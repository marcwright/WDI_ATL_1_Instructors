CREATE TABLE skaters (
first_name varchar(50),
last_name varchar(50) NOT NULL,
country varchar(70) NOT NULL,
event varchar (70) NOT NULL,
score INTEGER(3),
metal varchar(6),
created_date DATE,
deleted_date DATE
);

CREATE TABLE judges (
first_name varchar(50),
last_name varchar(50) NOT NULL
);

CREATE TABLE score (
skater_id INTEGER REFERENCES skaters (id) NOT NULL,
judge_id INTEGER REFERENCES judges (id) NOT NULL
);
