require 'pg'

superhero_conn = PG.connect(:dbname => 'super_hero_db', :host => 'localhost')

# method to simplify getting user input
def get_answer_to(question)
  puts question
  answer = gets.chomp
end
# method listing out heros in 'superheros' table within 'super_hero_db' database
def list_heros(superhero_conn)
  hero_names = superhero_conn.exec("SELECT name FROM super_heros;").values
  count = 0
  hero_names.each do |name|
    count +=1
    puts "#{count}.) Superhero: #{name}"
  end
end
# method adding hero to table
def add_hero(superhero_conn)
  name      =   get_answer_to("What is your Superhero's name?")
  cover     =   get_answer_to("What is their alias?")
  has_cape  =   get_answer_to("Do they have a cape?")
    if has_cape.include? 'y'
      has_cape = true
      cape = "a derpy cape"
    else
      has_cape = false
      cape = "no cape"
    end
  strength  = get_answer_to("What is their power?")
  rival     = get_answer_to("Who is their rival?")
  superhero_conn.exec("INSERT INTO super_heros (name, cover, has_cape, strength, rival) VALUES ('#{name}', '#{cover}', '#{has_cape}', '#{strength}', '#{rival}');")
  puts "#{name}, or \"#{cover}\" *wink wink*, has #{cape} and with the power of #{strength} and a rival named #{rival}"
end
# method prompting user to select hero to look at more indepth
def view_details(superhero_conn, name)
  result = (superhero_conn.exec("SELECT * FROM super_heros WHERE name = '#{name}';")).values
    puts "The Superhero's Name: #{result[0][1]}"
    puts "#{name}'s Alias: #{result[0][2]}"
      if result[0][3] == true
        puts "#{name} wears a cape"
      else
        puts "#{name} doesn't wear a cape"
      end
    puts "#{name}'s power is #{result[0][4]}"
    puts "#{name}'s Rival is #{result[0][5]}"
end
# method prompting user to give info to update current hero in table
def update_hero(superhero_conn, superhero_name, input)
  case
    when 1
      name = get_answer_to("What would you like to change #{superhero_name}'s name to?")
      superhero_conn.exec("UPDATE super_heros SET name = '#{name}' WHERE name = '#{superhero_name}';")
    when 2
      cover = get_answer_to("What would you like to change #{superhero_name}'s alias to?")
      superhero_conn.exec("UPDATE super_heros SET cover = '#{cover}' WHERE name = '#{superhero_name}';")
    when 3
      has_cape = get_answer_to("Does the #{superhero_name} have a cape?")
      superhero_conn.exec("UPDATE super_heros SET has_cape = '#{has_cape}' WHERE name = '#{superhero_name}';")
    when 4
      strength = get_answer_to("What is #{superhero_name}'s strength?")
      superhero_conn.exec("UPDATE super_heros SET strength = '#{strength}' WHERE name = '#{superhero_name}';")
    when 5
      rival = get_answer_to("Who is #{superhero_name}'s rival?")
      superhero_conn.exec("UPDATE super_heros SET rival = '#{rival}' WHERE name = '#{superhero_name}';")
    else
    end
  end
  # method prompting user to delete current record in table
  def remove_superhero(superhero_conn, super_hero)
    superhero_conn.exec("DELETE FROM super_heros WHERE name = '#{super_hero}';")
  end

#menu loop
x = true
while x
  puts "What would you like to do?"
  puts "(I) Index - List all Super Heros"
  puts "(C) Add a Super Hero"
  puts "(R) View all info for a specific Super Hero"
  puts "(U) Update a Super Hero"
  puts "(D) Remove a Super Hero"
  input = gets.chomp.downcase

  if input.include? 'i'
    list_heros(superhero_conn)
  elsif input.include? 'c'
    add_hero(superhero_conn)
  elsif input.include? 'r'
    puts "Who would you like to see?"
    list_heros(superhero_conn)
    hero = gets.chomp
    view_details(superhero_conn, hero)
  elsif input.include? 'u'
    list_heros(superhero_conn)
    hero = get_answer_to("Who would you like to update?")
    puts "What would you like to update:"
    puts "1. Name"
    puts "2. Alias"
    puts "3. Cape?"
    puts "4. Power?"
    puts "5. Rival?"
    update = gets.chomp.to_i
    update_hero(superhero_conn, hero, update)
  elsif input.include? 'd'
    list_heros(superhero_conn)
    hero = get_answer_to("Who would you like to remove?")
    remove_superhero(superhero_conn, hero)
  else
    x= false
  end
end
