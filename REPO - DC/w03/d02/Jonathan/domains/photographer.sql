CREATE TABLE clients (
first_name varchar(50),
last_name varchar(50) NOT NULL,
email varchar(100),
address varchar(80),
city varchar(25),
state varchar(2),
created_date DATE,
deleted_date DATE
);

CREATE TABLE events (
event_title varchar(100) NOT NULL,
created_date DATE,
deleted_date DATE,
client_id INTEGER REFERENCES clients (id) NOT NULL
);

CREATE TABLE albums (
album_title varchar(100) NOT NULL,
created_date DATE,
deleted_date DATE
);
