CREATE TABLE seasons (
  id serial PRIMARY KEY,
  season_no integer NOT NULL,
  location varchar(50) NOT NULL,
  year integer NOT NULL,
  married_match boolean DEFAULT = '',
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL
  )

CREATE TABLE relationships (
  id serial PRIMARY KEY,
  bachelors_id integer REFERENCES seasons (id) NOT NULL,
  contestants_id integer REFERENCES constestants (id) NOT NULL,
  got_married boolean NOT NULL
  )


CREATE TABLE episodes (
  id serial PRIMARY KEY
  seasons_id integer REFERENCES seasons (id) NOT NULL,
  episode_no varchar(15) NOT NULL,
  air_date timestamp
  created_at timestamp
  updated_at timestamp
  )

  CREATE TABLE constestants(
  id serial PRIMARY KEY,
  seasons_id integer REFERENCES seasons (id) NOT NULL,
  last_episode_id integer NOT NULL,
  first_name varchar (50) NOT NULL,
  last_name varchar (50) NOT NULL,
  age integer NOT NULL,
  occupation varchar(100),
  gender varchar(6),
  created_at timestamp,
  updated_at timestamp
  )
