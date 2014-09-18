create table users (
  id serial primary key,
  email varchar(63) not null,
  first_name varchar(63) not null,
  last_name varchar(63) default ""
);

create table events (
  id serial primary key,
  host_id integer references users(id) not null,
  event_name varchar(127) not null,
  event_host varchar(63) not null,
  event_time datetime not null,
  address_1 varchar(63) not null,
  address_2 varchar(63) default "",
  city varchar(63) not null,
  state_abbrev varchar(2) not null,
  zipcode integer not null,
  event_message varchar(511) default ""
);

create table invitations (
  id serial primary key,
  event_id integer references events(id) not null,
  guest_id integer references users(id) not null,
  rsvp_status integer default -1, # rsvp_status = { -1: 'not yet replied', 0: 'no', 1: 'yes', 2: 'maybe' }
  additional_guests integer default 0,
  updated_time datetime not null
);

create table comments (
  id serial primary key,
  event_id integer references events(id) not null,
  thread_id integer references comments(id),
  commenter_id integer references users(id) not null,
  message varchar(255) not null,
  created_time datetime not null,
  photo_id integer references photos(id),
  poll_id integer references polls(id)
);

create table photos (
  id serial primary key,
  url varchar(127) unique not null
);

create table polls (
  id serial primary key,
  question varchar(255) not null,
  options varchar(255) not null
);
