require "pry"

apartments = []
menu = "0"

# trying to place apartment_data outside of blocks for global access
tenant_db = File.new("tenants.txt", "r")
  tenant_db.each do |line|
    apartment_data = line.split(",")

    apartment = {}

    #address
    apartment[:address] = apartment_data[0]
    #rent
    apartment[:monthly_rent] = apartment_data[1]
    #squarefootage
    apartment[:sqft] = apartment_data[2]
    #beds
    apartment[:num_beds] = apartment_data[3]
    #baths
    apartment[:num_baths] = apartment_data[4]
    #check for a single tenant value
    if apartment_data[5]
      apartment[:tenant1_name] = apartment_data[5]
    end
    #check for double tenant value
    if apartment_data[8]
      apartment[:tenant2_name] = apartment_data[8]
    end

    #place apartment hash in apartments array
    apartments << apartment

  end
tenant_db.close

def all_props(properties)
  all_props = properties.map do |apartment|
    apartment[:address]
  end
  return all_props
end

#binding.pry

while menu == "0"
    puts "Apartment City"
    puts "(1) View all apartments"
    puts "(2) View an apartment's details"
    puts "(3) Add an apartment"
    puts "(4) Sign an auto-e-lease"
    puts "(5) Quit"
    answer = gets.chomp

    if answer == "1"
      puts all_props(apartments)
            # puts "\n#{apartment_data[0]} - $#{apartment_data[1]}/mo #{apartment_data[2]} sqft - #{apartment_data[3]} br - #{apartment_data[4]} bath"
            #   if apartment_data[5] && apartment_data[8]
            #     puts "This unit is occupied by: #{apartment_data[5]} and #{apartment_data[8]}"
            #   elsif apartment_data[5]
            #     puts "This unit is occupied by: #{apartment_data[5]}"
            #   else
            #     puts "This unit is vacant"
            #   end
          # end

          # puts all_apartments(apartments)
        # tenant_db.each_line do |line|
        #   apartment_data = line.chomp.split(",")
        #   puts "Listing: #{address[0]} - #{monthly_rent[1]}\n#{sqft[2]} BRs #{num_beds[3]} sqft #{num_baths[4]}"
        # end

      #binding.pry
      # tenant_db.close
    # end
    elsif answer == "2"
      def view_prop(properties)
        view_prop = properties.map do |apartment|
          apartment[:address]
        end
        return view_prop
      end
      puts "Type an address to view more:"
      puts view_prop(apartments)
      details = gets.chomp
      if details == view_prop(apartments)
        puts "true"
      end
      #binding.pry
    elsif answer == "3"
      #initiate .txt file
      tenant_db = File.new("tenants.txt", "a+")
        #get apartment details
        puts "Enter Address:"
        address = gets.chomp
        puts "Monthly Rent Price:"
        monthly_rent = gets.chomp.to_i
        puts "Squarefootage:"
        sqft = gets.chomp.to_i
        puts "Bedrooms:"
        num_beds = gets.chomp.to_i
        puts "Baths:"
        num_baths = gets.chomp.to_i
        puts "Add tenant? (Y/N)"
        renters_ask = gets.chomp.downcase
        if renters_ask == "y"
          puts "How many tenants are there? 1 or 2?"
          renters_count = gets.chomp.to_i
            if renters_count == 1
              #get single tenant info
              puts "Tenant name:"
              tenant0_name = gets.chomp
              puts "Age: "
              tenant0_age = gets.chomp.to_i
              puts "Gender: "
              tenant0_gender = gets.chomp

              #add single tenant to an array
              tenant_single = [tenant0_name, tenant0_age, tenant0_gender]
              tenant_single = tenant_single.join(",")

              #combine tenant into csv friendly
              tenants = [tenant_single]

              #initiate apartment array
              apartment = [address, monthly_rent, sqft, num_beds, num_baths]
              apartment = apartment.join(",")
              apartment = [apartment, tenants]
              tenant_db.puts apartment.join(",")
              #binding.pry
            else
              #get tenant 1 & 2 info
              puts "Tenant 1 name:"
              tenant1_name = gets.chomp
              puts "Tenant 1 Age: "
              tenant1_age = gets.chomp.to_i
              puts "Tenant 1 Gender: "
              tenant1_gender = gets.chomp
              puts "Tenant 2 name:"
              tenant2_name = gets.chomp
              puts "Tenant 2 Age: "
              tenant2_age = gets.chomp.to_i
              puts "Tenant 2 Gender: "
              tenant2_gender = gets.chomp

              #add double tenant array
              tenant1 = [tenant1_name, tenant1_age, tenant1_gender]
              tenant1 = tenant1.join(",")
              tenant2 = [tenant2_name, tenant2_age, tenant2_gender]
              tenant2 = tenant2.join(",")

              #combine tenants into single array
              tenant_double = [tenant1, tenant2]
              tenant_double = tenant_double.join(",")
              tenants = [tenant_double]

              #add to full apartment array
              apartment = [address, monthly_rent, sqft, num_beds, num_baths]
              apartment = apartment.join(",")
              apartment = [apartment, tenants]
              tenant_db.puts apartment.join(",")
              #binding.pry
              tenant_db.close
            end
          else

          #add full apartment to array with 0 tenants
          apartment = [address, monthly_rent, sqft, num_beds, num_baths]
          # apartment = apartment.join(",")
          # apartment = [apartment]
          tenant_db.puts apartment.join(",")
          tenant_db.close
        end
        # tenants = [tentant_single, tenant_double]
        # tenant_db.puts tenants.join(",")
        # tenant_db.close
        # apartment = [address, monthly_rent, sqft, num_beds, num_baths, tenants]
        # tenant_db.puts apartment.join(",")
        # tenant_db.close

        # tenant.puts tenant.join(",")
      # tenant_db.close
    elsif answer == "4"
      #needs to merge into apartments array and match index of vacant apartment
    else
      menu = "1"
    end
end
