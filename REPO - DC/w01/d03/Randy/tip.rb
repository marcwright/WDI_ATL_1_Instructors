def ask(question)
	puts question
	return gets.chomp.to_f
end

	bill_total = ask("What was the total of the bill?")
	tax_percent = ask("What is the tax percentage?")/100
	tip_percent = ask("What is the tip percentage you'd like to leave (20% is standard).")/100

pre_tip_total = bill_total + (bill_total*tax_percent)
tip_amount = pre_tip_total*tip_percent
total_total = pre_tip_total + tip_amount

puts "Your tip should be #{tip_amount.round(2)}, making your total bill #{total_total.round(2)}"