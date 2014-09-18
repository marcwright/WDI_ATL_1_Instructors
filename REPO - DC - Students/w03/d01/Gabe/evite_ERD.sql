
CREATE TABLE event(
id SERIAL PRIMARY KEY,
event_host VARCHAR(50) references event_hosts(user_name) NOT NULL,
event_date VARCHAR(50) NOT NULL,
event_location VARCHAR(100) NOT NULL,
event_message VARCHAR (500) default " ");
invited_emails VARCHAR(50) NOT NULL,
invited_guest_status VARCHAR(5) references invitees(response_status) default "Not yet responded");


CREATE TABLE comments(
id SERIAL PRIMARY KEY,
message VARCHAR(50) default " ");

CREATE TABLE invitation(
id SERIAL PRIMARY KEY,
rspv VARCHAR(20) default "not yet responded",
additional_guests INTEGER,
custom_invite_url VARCHAR NOT NULL);

CREATE TABLE user(
id SERIAL PRIMARY KEY,
email VARCHAR(50) NOT NULL,
first_name VARCHAR(50) default " ",
last_name VARCHAR(50) default " ");