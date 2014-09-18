require 'pg'
require 'pry'


superhero_conn = PG.connect(:dbname => 'super_hero_db', :host => 'localhost')

file = File.new("superhero.csv", "a+")

file.each do |line|
  super_heros_array = line.split(",")
  name = super_heros_array[0]
  cover = super_heros_array[1]
  has_cape = super_heros_array[2]
  strength = super_heros_array[3]
  rival = super_heros_array[4]

  sql  = "INSERT INTO super_heros (name, cover, has_cape, strength, rival)"
  sql += "VALUES ( '#{name}', '#{cover}', '#{has_cape}', '#{strength}', '#{rival}');"

  superhero_conn.exec(sql)

end

file.close

superhero_conn.close
