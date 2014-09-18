DROP TABLE IF EXISTS superheroes;

CREATE TABLE superheroes (
  id serial PRIMARY KEY,
  superhero_name VARCHAR(50) NOT NULL,
  alter_ego VARCHAR(50) NOT NULL,
  has_cape BOOLEAN DEFAULT('false'),
  power VARCHAR(50) NOT NULL,
  arch_nemesis VARCHAR(50) NOT NULL
);
