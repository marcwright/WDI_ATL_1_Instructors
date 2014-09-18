require 'pry'
require 'pg'

db = PG.connect(:dbname =>'facebook', :host => 'localhost')
begin
  db.exec( "select * from people" ) do |result|
    result.each do |row|
      # do stuff
      puts "#{row['first']} #{row['last']}"
    end
  end

  print "full name: "
  name = gets.chomp.split
  print "dob: "
  dob = gets.chomp
  print "rel: "
  relationship = gets.chomp
  print "city: "
  city = gets.chomp

  sql = "insert into people ( first, last, dob, relationship, city) values ('#{name[0]}', '#{name[1]}', '#{dob}', '#{relationship}', '#{city}' )"

  db.exec(sql)


ensure
  db.close
end

