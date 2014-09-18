DROP TABLE IF EXISTS invitation;

CREATE TABLE invitation (
  id serial PRIMARY KEY,
  email varchar(25) NOT NULL,
  viewed boolean,
  date_time timestamp,
  comment varchar(100),
  reply varchar(5)
);

DROP TABLE IF EXISTS invitation;

CREATE TABLE event(
id serial PRIMARY KEY,
name varchar(50) NOT NULL,
time varchar(20) NOT NULL,
location varchar(50),
description varchar(100),
host_name varchar(25)
);
