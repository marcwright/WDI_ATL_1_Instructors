require 'pg'

superhero_conn = PG.connect(:dbname => 'superheroes_db', :host => 'localhost')

file = File.new("superheroes.csv", "a+")

file.each do |line|
  superhero = line.split(",")
  superhero_name = superhero[0]
  alter_ego = superhero[1]
  has_cape = superhero[2]
  power = superhero[3]
  arch_nemesis = superhero[4]

  sql  = "INSERT INTO superheroes (superhero_name, alter_ego, has_cape, power, arch_nemesis)"
  sql += "VALUES ( '#{superhero_name}', '#{alter_ego}', '#{has_cape}', '#{power}', '#{arch_nemesis}');"

  superhero_conn.exec(sql)

end

file.close

superhero_conn.close


