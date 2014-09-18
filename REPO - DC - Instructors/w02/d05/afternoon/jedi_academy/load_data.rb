require 'pg'

db_conn = PG.connect(:dbname => 'jedi_academy', :host => 'localhost')

file = File.new("data.csv", "a+")

file.each do |line|
  padawan = line.split(",")
  name = padawan[0].gsub("'","")
  lightsaber = padawan[1]
  years_training = padawan[2]
  tempted_by_dark_side = padawan[3]
  temptation = padawan[4]

  sql = "INSERT INTO padawans (name, lightsaber, years_training, tempted_by_dark_side, temptation)"
  sql += "VALUES ( '#{name}', '#{lightsaber}', '#{years_training}', '#{tempted_by_dark_side}', '#{temptation}');"

  db_conn.exec(sql)

end

file.close

db_conn.close
