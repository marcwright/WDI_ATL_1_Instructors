CREATE TABLE journal (
id serial PRIMARY KEY,
trip_title varchar(100) NOT NULL,
created_date DATE,
deleted_date DATE,
journal_entr text,
city_tag varchar (50) UNIQUE
)

CREATE TABLE travelers (
id serial PRIMARY KEY,
first_name varchar(50),
last_name varchar(50),
email
)
