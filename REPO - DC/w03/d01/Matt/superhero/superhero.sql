DROP TABLE IF EXISTS superheroes;

CREATE TABLE superheroes (
  id serial PRIMARY KEY,
  superhero_name varchar(80) NOT NULL,
  alter_ego varchar(80) NOT NULL,
  has_cape boolean NOT NULL,
  power varchar(100) NOT NULL,
  arch_nemesis varchar(100) NOT NULL
);

INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis) VALUES
('Superman','Clark Kent',true,'strength','Lex Luthor'),
('Wonder Woman','Diana Prince',false,'strength','Cheetah'),
('Batman','Bruce Wayne',true,'intelligence','Joker'),
('Mr Incredible','Robert Parr',false,'strength','Syndrome'),
('Professor X','Charles Xavier',false,'psychic','Magneto'),
('Spiderman','Peter Parker',false,'wall climbing','Doctor Octopus'),
('Captain America','Steve Rogers',false,'super soldier','Red Skull'),
('Iron Man','Tony Stark',false,'iron suit','Mandarin'),
('Wolverine','Logan',false,'healing','Sabretooth');
