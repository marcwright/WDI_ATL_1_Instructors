# Foreign Keys

**One-to-many**:

```SQL
CREATE TABLE houses (
  id serial PRIMARY KEY,
  title varchar(300) NOT NULL,
  color varchar(50) NOT NULL
);

CREATE TABLE students (
  id serial PRIMARY KEY,
  house_id integer REFERENCES houses (id) NOT NULL,
  email varchar(300) UNIQUE NOT NULL,
  first_name varchar(100) NOT NULL,
  middle_name varchar(100) DEFAULT '',
  last_name varchar(100) NOT NULL
);
```

**Many-to-many**:

```SQL
CREATE TABLE subjects (
  id serial PRIMARY KEY,
  title varchar(300) NOT NULL
);

CREATE TABLE students (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL
);

CREATE TABLE rel_students_subjects (
  id serial PRIMARY KEY,
  student_id integer REFERENCES students (id) NOT NULL,
  subject_id integer REFERENCES subjects (id) NOT NULL
);
```
