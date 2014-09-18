TRAVEL LOG

CREATE TABLE journal_entry (
  id serial PRIMARY KEY,
  location_id integer REFERENCES location (id) NOT NULL,
  body text,
  date_created date
);

CREATE TABLE location (
  id serial PRIMARY KEY,
  country varchar(100) NOT NULL,
  state/province varchar(100) NOT NULL,
  city varchar(100),
  address varchar(200),
  description text
);


PHOTO MANAGEMENT APP

CREATE TABLE client (
  id serial PRIMARY KEY,
  name varchar(100) UNIQUE,
  address varchar(200) NOT NULL,
  email_address varchar(100) UNIQUE
);

CREATE TABLE event (
  id serial PRIMARY KEY,
  client_id integer REFERENCES client (id) NOT NULL,
  event_location varchar(100) NOT NULL,
  event_date date, NOT NULL
  event_details text
);

CREATE TABLE photo (
  id serial PRIMARY KEY,
  event_id integer REFERENCES event (id) NOT NULL,
  photo_URL varchar(100) UNIQUE,
  photo_description text
);


FIGURE SKATING

CREATE TABLE skater (
  id serial PRIMARY KEY,
  name varchar(100) UNIQUE, NOT NULL,
  nationality varchar(100) NOT NULL,
  skater_bio/stats text
);

CREATE TABLE score (
  id serial PRIMARY KEY,
  skater_id integer REFERENCES skater (id) NOT NULL,
  judge_id integer REFERENCES judge (id) NOT NULL,
  score integer NOT NULL
);

CREATE TABLE judge (
  id serial PRIMARY KEY,
  name varchar(100) UNIQUE,
  nationality varchar(100) NOT NULL,
  judge_bio text
);


SNAPCHAT

CREATE TABLE user (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  email_address varchar(100) UNIQUE
);

CREATE TABLE snapshot (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id) NOT NULL,
  image_url varchar(100) UNIQUE
);

CREATE TABLE friend (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id) NOT NULL,
  name varchar(100) NOT NULL,
  email_address varchar(100) UNIQUE
);

CREATE TABLE friend_snapshot (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id) NOT NULL,
  snapshot_id integer REFERENCES snapshot (id) NOT NULL,
);


THE BACHELOR

CREATE TABLE season (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  season_number integer UNIQUE
);

CREATE TABLE episode (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  episode_number integer(2) NOT NULL
);

CREATE TABLE contestant (
  id serial PRIMARY KEY,
  name varchar(100) UNIQUE,
  contestant_bio text
);

CREATE TABLE contestant_episode (
  id serial PRIMARY KEY,
  contestant_id integer REFERENCES contestant (id),
  episode_id integer REFERENCES episode (id)
);
