puts "enter full meal price"
price = gets.chomp.to_f
puts "enter tax %"
taxrt = gets.chomp.to_f
puts "what % tip do you want to leave?"
tip_percent = gets.chomp.to_f
puts "leave tip on tax? y / n "
tip_on = gets.chomp.downcase

def tip_method(price, taxrt, tip_percent, tip_on)
	price_n_tax = price + (price / taxrt)
	tip_not_tax = price * tip_percent
	tip_on_tax = price * price_n_tax
end

	puts "total bill (price and tax) = #{price_n_tax}"
	puts "tip on price only : #{tip_not_tax}"
	puts "tip on total bill: #{tip_on_tax}"
 #DOESNT WORK






