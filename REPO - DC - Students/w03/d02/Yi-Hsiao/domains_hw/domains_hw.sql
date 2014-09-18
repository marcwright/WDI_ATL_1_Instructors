-- Travel Log --
CREATE TABLE travels (
  id          SERIAL PRIMARY KEY,
  city        VARCHAR(45) NOT NULL,
  country     VARCHAR(45) NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL
);

CREATE TABLE entries (
  id                SERIAL PRIMARY KEY,
  destinations_id   INT REFERENCES travels NOT NULL,
  title             VARCHAR(45) NOT NULL,
  entry_text        TEXT NOT NULL,
  created_at        DATETIME NOT NULL,
  updated_at        DATETIME NOT NULL
);


-- Photo Management App --
CREATE TABLE clients (
  id              SERIAL PRIMARY KEY,
  first_name      VARCHAR(45) NOT NULL,
  last_name       VARCHAR(45) NOT NULL,
  address1        VARCHAR(45) NOT NULL,
  address2        VARCHAR(45) NOT NULL,
  city            VARCHAR(45) NOT NULL,
  state           VARCHAR(45) NOT NULL,
  zip             VARCHAR(45) NOT NULL,
  phone_number    VARCHAR(45) NULL DEFAULT '',
  email_address   VARCHAR(45) NULL DEFAULT '',
  created_at      DATETIME NOT NULL,
  updated_at      DATETIME NOT NULL
);

CREATE TABLE events (
  id          SERIAL PRIMARY KEY,
  client_id   INT REFERENCES clients NOT NULL,
  event_type  VARCHAR(45) NOT NULL,
  event_date  DATE NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL
);

CREATE TABLE photos (
  id          SERIAL PRIMARY KEY,
  event_id    INT REFERENCES events NOT NULL,
  url         VARCHAR(45) NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL
);


-- Figure Skating --
CREATE TABLE judges (
  id          SERIAL PRIMARY KEY,
  first_name  VARCHAR(45) NOT NULL,
  last_name   VARCHAR(45) NOT NULL,
  country     VARCHAR(45) NOT NULL
);

CREATE TABLE skaters (
  id              SERIAL PRIMARY KEY,
  first_name      VARCHAR(45) NOT NULL,
  last_name       VARCHAR(45) NOT NULL,
  country         VARCHAR(45) NOT NULL,
  height_inches   INT NOT NULL,
  weight_lbs      INT NOT NULL,
  age             INT NOT NULL
);

CREATE TABLE scores (
  id          SERIAL PRIMARY KEY,
  judge_id    INT REFERENCES judges NOT NULL,
  skater_id   INT REFERENCES skaters NOT NULL,
  event_type  VARCHAR(45) NOT NULL,
  round_no    INT NOT NULL,
  score       DECIMAL NOT NULL
);


-- Snapchat --
CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  username    VARCHAR(45) NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL
);

CREATE TABLE snapshots (
  id          SERIAL PRIMARY KEY,
  author_id   INT REFERENCES users,
  url         VARCHAR(45) NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL,
  expires_at  DATETIME NOT NULL
);

CREATE TABLE snapshots_users (
  user_id       INT REFERENCES users,
  snapshot_id   INT REFERENCES snapshots,
  PRIMARY KEY(user_id, snapshot_id)
);


-- The Bachelor --
CREATE TABLE seasons (
  id              SERIAL PRIMARY KEY,
  season_no       VARCHAR(45) NOT NULL,
  location        VARCHAR(45) NOT NULL,
  year            INT NOT NULL,
  married_match   TINYINT(1) NOT NULL DEFAULT 0,
  created_at      DATETIME NOT NULL,
  updated_at      DATETIME NOT NULL
);

CREATE TABLE episodes (
  id          SERIAL PRIMARY KEY,
  season_id   INT REFERENCES seasons NOT NULL,
  episode_no  VARCHAR(45) NOT NULL,
  air_date    DATE NOT NULL,
  created_at  DATETIME NOT NULL,
  updated_at  DATETIME NOT NULL
);

CREATE TABLE contestants (
  id                SERIAL PRIMARY KEY,
  season_id         INT NOT NULL,
  last_episode_id   INT NOT NULL,
  first_name        VARCHAR(45) NOT NULL,
  last_name         VARCHAR(45) NOT NULL,
  age               INT(2) NOT NULL,
  occupation        VARCHAR(45) NOT NULL,
  gender            CHAR(1) NOT NULL,
  created_at        DATETIME NOT NULL,
  updated_at        DATETIME NOT NULL
);

CREATE TABLE relationships (
  bachelor_id   INT REFERENCES contestants NOT NULL,
  winner_id     INT REFERENCES contestants NOT NULL,
  got_married   BOOLEAN NOT NULL
  PRIMARY KEY(bachelor_id, winner_id)
);
