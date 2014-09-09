
CREATE TABLE themes (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(500) NOT NULL,
  stylesheet varchar(500) NOT NULL
);

CREATE TABLE events (
  id serial PRIMARY KEY,
  theme_id integer REFERENCES themes (id) NOT NULL,
  host_user_id integer REFERENCES users (id) NOT NULL,
  title varchar(100) NOT NULL,
  event_date timestamp NOT NULL,
  host varchar(100),
  location1 varchar(100),
  location2 varchar(100),
  message text
);

CREATE TABLE users (
  id serial PRIMARY KEY,
  email varchar(300) UNIQUE,
  first_name varchar(100),
  last_name varchar(100)
);

CREATE TABLE invitations (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events (id) NOT NULL,
  user_id integer REFERENCES users (id) NOT NULL,
  invite_url varchar(100)  NOT NULL,
  accepted_status varchar(1) DEFAULT '?',
  additional_guests integer DEFAULT 0,
  last_accessed timestamp
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  event_id integer REFERENCES events (id) NOT NULL,
  user_id integer REFERENCES users (id),
  comment text NOT NULL
);

INSERT INTO themes (title, image, stylesheet) VALUES ('silly', 'silly.jpg', 'silly.css');
INSERT INTO events (theme_id, title, event_date) VALUES (1, 'Rock the party', now());
INSERT INTO users (user) VALUES ('greg@mac.co');
INSERT INTO invitations (event_id, user_id, party_size) VALUES (1, 1, 1);
INSERT INTO comments (event_id, comment) VALUES (1, 'Looking forward to it!');
