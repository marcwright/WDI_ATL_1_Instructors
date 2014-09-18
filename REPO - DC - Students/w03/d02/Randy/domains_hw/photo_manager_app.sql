#Let's assume a theme table exists elsewhere...


CREATE TABLE clients(
id serial PRIMARY KEY,
first_name VARCHAR(42) NOT NULL,
last_name VARCHAR(42) NOT NULL,
phone_num VARCHAR(12) NOT NULL,
email VARCHAR(42) UNIQUE,
billing_info VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
address VARCHAR(8) NOT NULL,
);

CREATE TABLE events(
id serial PRIMARY KEY,
theme_id REFERENCE theme(id) NOT NULL,
description TEXT NOT NULL,
event_date VARCHAR(8) NOT NULL,
location VARCHAR(42) NOT NULL,
client_id REFERENCE clients(id) NOT NULL
);

CREATE TABLE photos(
id serial PRIMARY KEY,
event_id REFERENCE events(id) NOT NULL,
description TEXT NOT NULL,
photo_date VARCHAR(8) NOT NULL,
photo_location VARCHAR(42) NOT NULL,
);


