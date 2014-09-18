

apartment_array = [
{address: "1325 15th Street, Apt 830", monthly_rent: "2000", sqft: "650", num_beds: "1", num_baths: "1", renters: "1"},
{address: "17 New York Avenue, Apt 108", monthly_rent: "1250", sqft: "575", num_beds: "0", num_baths: "1", renters: "1"},
{address: "4478 34th Street, Apt 1755", monthly_rent: "3000", sqft: "1000", num_beds: "2", num_baths: "1", renters: "2"}]


menu_choice = true
while menu_choice != "QUIT"
  puts "What would you like to do? Please choose one from menu below."
  puts "MENU: LIST OF ALL APARTMENTS    VIEW APARTMENT DETAILS    ADD AN APARTMENT    ADD A TENANT TO AN APARTMENT    QUIT"
  menu_choice = gets.chomp.upcase

  case menu_choice
    when "LIST OF ALL APARTMENTS"
      apartment_array.each do |apartment_listing|
        puts apartment_listing[:address]
      end

    when "VIEW APARTMENT DETAILS"
      apartment_array.each do |apartment_listing|
        puts (apartment_array.index(apartment_listing) + 1).to_s + ". " + apartment_listing[:address]
      end
      puts "Which number apartment would you like details for?"
      apartment_number_choice = gets.chomp.downcase
      apartment_array.each do |apartment_listing|
        if (apartment_array.index(apartment_listing) + 1).to_s == apartment_number_choice
          puts apartment_listing
        end
      end

    when "ADD AN APARTMENT"
      new_entry_hash = {}
      def add_apartment(query, key, hash)
        puts query
        hash[key] = gets.chomp
      end
      add_apartment("What is the full street address?", :address, new_entry_hash)
      add_apartment("What is the monthly rent", :monthly_rent,new_entry_hash)
      add_apartment("What is the square footage?", :sqft, new_entry_hash)
      add_apartment("How many bedrooms?", :num_beds, new_entry_hash)
      add_apartment("How many bathrooms?", :num_baths, new_entry_hash)
      add_apartment("How many renters?", :renters, new_entry_hash)
      apartment_array.push(new_entry_hash)

    when "ADD A TENANT TO AN APARTMENT"
      puts  ("Which apartment would you like to add a tenant to?")
      apartment_array.each do |apartment_listing|
        puts (apartment_array.index(apartment_listing) + 1).to_s + ". " + apartment_listing[:address]
      end
      apartment_choice = gets.chomp
      def add_person(query,key,person_hash)
        puts query
        person_hash[key] = gets.chomp
      end
      new_person_hash = {}
      add_person("What is the new tenant's name?", :name, new_person_hash)
      add_person("What is the new tenant's age?", :age, new_person_hash)
      add_person("What is the new tenant's gender?", :gender, new_person_hash)
      apartment_array[apartment_choice.to_i - 1][:renters].push(new_person_hash)

  end
end

