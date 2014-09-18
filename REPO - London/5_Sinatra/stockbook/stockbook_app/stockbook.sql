create table categories (
  id serial4 primary key,
  name varchar(255) not null
);

create table portfolios (
  id serial4 primary key,
  name varchar(255) not null,
  description text,
  category_id integer
);

create table stocks (
  id serial4 primary key,
  symbol varchar(255) not null,
  name varchar(255),
  buying_price decimal,
  holding integer,
  portfolio_id integer
);

drop table yahoos;
create table yahoos (
  id serial4 primary key,
  symbol varchar(255) unique,
  object text,
  created_at timestamp default current_timestamp
);

