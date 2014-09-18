CREATE TABLE people
(
  id serial8 primary key,
  first varchar(20) not null,
  dob date check (dob < '1 jan 2001'),
  relationship varchar(50),
  friends int2 default 0,
  city varchar(20)
);