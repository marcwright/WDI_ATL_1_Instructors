DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL,
  has_shell BOOLEAN DEFAULT TRUE,
  photo_url VARCHAR(255)
);
