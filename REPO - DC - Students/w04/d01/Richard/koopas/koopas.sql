DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  color varchar(15) NOT NULL,
  has_shell BOOLEAN DEFAULT true,
  photo_url text
  );
