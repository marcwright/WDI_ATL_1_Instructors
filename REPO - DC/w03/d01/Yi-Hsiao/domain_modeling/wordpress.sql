create table blogs (
  id serial primary key,
  title varchar(127) not null,
  subtitle varchar(63) default "",
  description text default "",
  url varchar(127) unique not null,
  created_time datetime not null
);

create table authors (
  id serial primary key,
  blog_id integer references blogs not null,
  first_name varchar(63) not null,
  last_name varchar(63) not null,
  email varchar(127) not null
);

create table posts (
  id serial primary key,
  author_id integer references authors not null,
  title varchar(127) not null,
  post_text text not null,
  url varchar(127) unique not null,
  created_time datetime not null
);

create table categories (
  id serial primary key,
  name varchar(63) unique not null,
  parent integer references categories
);

create table categories_posts (
  post_id integer references posts not null,
  category_id integer references categories not null,
  primary key (post_id, category_id)
);

create table tags (
  id serial primary key,
  tag_name varchar(63) unique not null
);

create table posts_tags (
  post_id integer references posts not null,
  tag_id integer references tags not null,
  primary key (post_id, tag_id)
);

create table comments (
  id serial primary key,
  commenter_email varchar(127) not null,
  commenter_name varchar(127) not null,
  commenter_website varchar(127) default "",
  post_id integer references posts not null,
  thread_id integer references comments,
  comment_text text not null,
  created_time datetime not null
);
