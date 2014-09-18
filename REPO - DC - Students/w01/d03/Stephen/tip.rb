# Stephen Stanwood (stephen@stanwoodsolutions.com)

print "How much did your meal cost? "
base = gets.to_f
print "What's the tax %? "
tax_percent = gets.to_f
print "What % do you want to tip? "
tip_percent = gets.to_f
with_tax = base * (1 + 0.01 * tax_percent)
total = with_tax * (1 + 0.01 * tip_percent)
print "Your total is $#{(total).round(2)}"
