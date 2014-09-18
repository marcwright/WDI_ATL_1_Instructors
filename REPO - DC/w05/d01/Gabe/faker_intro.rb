def gen_random_address
address_holder = []
address_holder = (0...8).map { (64 + rand(26)).chr }.join
street =
return address_holder
end

puts gen_random_address
