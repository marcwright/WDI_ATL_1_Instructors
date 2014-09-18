require 'pry-byebug'
require 'pg'
 
db = PG.connect(:dbname =>'facebook', :host => 'localhost')
begin
  db.exec( "select * from people" ) do |result|
    result.each do |row|
      puts "#{row['first']} #{row['friends']}"
    end
  end
  
  puts "first name: "
  name = gets.chomp
  puts "dob: "
  dob = gets.chomp
  puts "Relationship: "
  relationship = gets.chomp
  puts "City: "
  city = gets.chomp

  sql = "INSERT INTO people (first, dob, relationship, city) VALUES ('#{name}', '#{dob}', '#{relationship}', '#{city}')"

  db.exec(sql)
ensure
  db.close
end




