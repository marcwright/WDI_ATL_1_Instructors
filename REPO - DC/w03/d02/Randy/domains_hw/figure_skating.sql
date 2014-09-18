CREATE TABLE skaters(
id serial PRIMARY KEY,
first_name VARCHAR(42) NOT NULL,
last_name VARCHAR(42) NOT NULL,
nationality VARCHAR(72) NOT NULL,
age INTEGER NOT NULL
);

CREATE TABLE judges(
id serial PRIMARY KEY,
first_name VARCHAR(42) NOT NULL,
last_name VARCHAR(42) NOT NULL,
nationality VARCHAR(72) NOT NULL,
years_exp INTEGER, NOT NULL
);

CREATE TABLE scores(
id serial PRIMARY KEY,
skater_id REFERENCE skaters(id) NOT NULL,
judege_id REFERENCE judges(id) NOT NULL,
form_val INTEGER NOT NULL,
costume_val INTEGER NOT NULL,
technical_val INTEGER NOT NULL,
deductions INTEGER NOT NULL
);
