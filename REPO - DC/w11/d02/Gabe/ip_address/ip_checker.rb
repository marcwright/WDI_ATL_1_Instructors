require 'pry'

ip_to_check = 0
while ip_to_check != "1"
  puts 'Enter an IP to check it\'s validity. Type \'1\' to quit.'
  ip_to_check = gets.chomp

  # if ip_to_check == /(\b[0-2]{1}+[0-5]{2}\b|\b([0-9]{2}\b|\b[0-9]{1}\b))/
  regex = /(\b[0-2]{1}+[0-5]{2}\b|\b([0-9]{2}\b|\b[0-9]{1}\b))\.(\b[0-2]{1}+[0-5]{2}\b|\b([0-9]{2}\b|\b[0-9]{1}\b))\.(\b[0-2]{1}+[0-5]{2}\b|\b([0-9]{2}\b|\b[0-9]{1}\b))\.(\b[0-2]{1}+[0-5]{2}\b|\b([0-9]{2}\b|\b[0-9]{1}\b))/
  if regex.match(ip_to_check)
    puts "The IP is valid!"
  else
    puts "INVALID IP."
  end
end
