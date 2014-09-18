require 'PG'
sh_conn = PG.connect(dbname: 'superheros_db', host: 'localhost')

file = File.new("superheroes.csv", "a+")
file.each do |line|
  superhero = line.split(",")
  superhero_name = superhero[0]
  alter_ego = superhero[1]
  has_cape = superhero[2]
  power = superhero[3]
  arch_nemesis = superhero[4]

  sql = "INSERT INTO heros (superhero_name, alter_ego, has_cape, power, arch_nemesis"
  sql += "VALUES( '#{superhero_name}' '#{alter_ego}' '#{has_cape}' '#{power}' '#{arch_nemesis}');"

  sh_conn.exec(sql)
end
file.close
sh_conn.close
