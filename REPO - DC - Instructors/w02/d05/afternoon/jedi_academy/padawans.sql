DROP TABLE IF EXISTS padawans;

CREATE TABLE padawans (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  lightsaber varchar(50) NOT NULL,
  years_training integer NOT NULL,
  tempted_by_dark_side boolean NOT NULL,
  temptation varchar(50) NOT NULL
);
