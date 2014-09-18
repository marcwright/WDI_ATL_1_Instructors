require 'pry'

def get_data
  print "write person to file? (y/n) "
  gets.chomp.downcase
end

f = File.new('database.txt', 'a+')
begin
  response = get_data
  while response == 'y'
    print 'Enter name, age, sex: '
    f.puts(gets.chomp)
    response = get_data
  end
ensure
  f.close
end


# binding.pry
