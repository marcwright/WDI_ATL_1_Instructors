CREATE TABLE clubbers (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  gender varchar(1) NOT NULL,
  age integer NOT NULL
);


CREATE TABLE journal (
id serial PRIMARY KEY,
trip_title varchar(100) NOT NULL,
created varchar(10) NOT NULL,
deleted varchar(10),
journal_entr text,
city_tag varchar (50) UNIQUE
)

CREATE TABLE travelers (
id serial PRIMARY KEY,
name
email
)
