CREATE TABLE users (
first_name varchar(50),
last_name varchar(50),
email varchar(100),
created_date DATE,
deleted_date DATE
);

CREATE TABLE snapshots (
reference URL NOT NULL,
created_date DATE,
deleted_date DATE
);

CREATE TABLE user_snapshots (
user_id INTEGER REFERENCES users (id) NOT NULL,
snapshot_id INTEGER REFERENCES snapshots (id) NOT NULL
);
