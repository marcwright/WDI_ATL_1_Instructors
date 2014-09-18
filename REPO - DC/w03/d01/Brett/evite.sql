
CREATE TABLE events(
id serial PRIMARY KEY,
event_title varchar(500) NOT NULL,
when event_date timestamp NOT NULL,
location1 varchar(500) NOT NULL,
location2 varchar(500) DEFAULT(" "),
host_name varchar(140) REFERENCES users (id)
host varchar(100)
message text
);

CREATE TABLE comments (
id serial PRIMARY KEY,
comment text
event_id integer REFERENCES events (id) NOT NULL
user_id integer REFERENCES users (id),
);

CREATE TABLE invitation (
id serial PRIMARY KEY,
rsvp varchar(100) DEFAULT("Not Yet Replied"),
additional_guests integer DEFAULT(0)
invite_url varchar(100) NOT NULL UNIQUE
event_id integer REFERENCES events (id)
user_id integer REFERENCES users (id)
last_accessed timestamp
);

CREATE TABLE users(
id serial PRIMARY KEY,
email varchar(140) NOT NULL,
first_name varchar(100) DEFAULT(" "),
last_name varchar(100) DEFAULT(" ")
);
