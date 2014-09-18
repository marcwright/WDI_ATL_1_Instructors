require 'pg'
require 'pry'


db_conn = PG.connect(:dbname => 'super_hero_db', :host => 'localhost')

file = File.new("superhero.csv", "a+")

file.each do |line|
  super_heros = line.split(",")
  name = super_heros[0].gsub("'","")
  cover = super_heros[1]
  has_cape = super_heros[2]
  strength = super_heros[3]
  rival = super_heros[4]

  sql  = "INSERT INTO players (name, age, team, games, points)"
  sql += "VALUES ( '#{name}', '#{cover}', '#{has_cape}', '#{strength}', '#{strength}');"

  superhero_conn.exec(sql)

end

file.close

superheros_conn.close
