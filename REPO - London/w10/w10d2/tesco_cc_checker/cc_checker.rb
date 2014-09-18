# run from command line thus:
#   ruby ./cc_checker.rb card_numbers.txt

require_relative "credit_card_number.rb"

ARGF.each_line do |line|
  cc = CreditCardNumber.new(line)
  puts "#{cc.card_type}: #{cc.number} (#{cc.valid? ? 'valid' : 'invalid'})"
end


