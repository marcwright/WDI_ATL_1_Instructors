-- Stephen Stanwood (stephen@stanwoodsolu)

-- DROP TABLE IF EXISTS events

-- CREATE TABLE events (
--   id SERIAL PRIMARY KEY,
--   theme_id REFERENCES themes(id)
--   when TIMESTAMP NOT NULL,
--   location1 VARCHAR(50) NOT NULL,
--   location2 VARCHAR(50) NOT NULL,
--   title VARCHAR(100) NOT NULL,
--   host_name REFERENCES users(first_name)
-- );

-- CREATE TYPE RSVP AS ENUM ('Y','N','M');

-- CREATE TABLE invitations (
--   id SERIAL PRIMARY KEY,
--   response RSVP NOT NULL,
--   guest_num INTEGER NOT NULL,
--   eid VARCHAR(30) NOT NULL UNIQUE,
-- );

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   email VARCHAR(254) NOT NULL,
--   first_name VARCHAR(50) NOT NULL,
--   last_name VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE themes (
-- );

-- CREATE TYPE EVENT_TYPE AS ENUM ('Birthday','Wedding');
-- CREATE TYPE RESPONSE AS ENUM ('Yes','No','Maybe');

-- DROP TABLE IF EXISTS events

-- CREATE TABLE events (
--   id SERIAL PRIMARY KEY,
--   eid VARCHAR(30) NOT NULL UNIQUE,
--   title VARCHAR(75) NOT NULL,
--   type EVENT_TYPE NOT NULL,
--   theme_id INTEGER NOT NULL,
--   host_name VARCHAR(50) REFERENCES users(name) NOT NULL,
--   start_time TIME NOT NULL,
-- );

-- CREATE TABLE invitations (
--   id SERIAL PRIMARY KEY,
--   gid VARCHAR(30) NOT NULL UNIQUE,

-- )

-- CREATE TABLE users (

-- );
