def prompt_user(query)
  puts query
  return gets.chomp
end

def list
  db_conn.exec("SELECT * from superheroes;")
end

def add
  superhero_name = prompt_user("What is the hero's name?")
  alter_ego = prompt_user("What is the user's civilian alter ego?")
  response = prompt_user("Does this hero have a cape? (y/n)")
  if response == "y"
    has_cape? = true
  else
    has_cape? = false
  end
  power = prompt_user("What is this hero's special power?")
  arch_nemesis = prompt_user("Who is this hero's arch nemesis?")


  sql = "INSERT INTO superheroes (superhero_name, alter_ego, has_cape?, power, arch_nemesis)"
  sql += "VALUES ( '#{superhero_name}', '#{alter_ego}', '#{has_cape?}', '#{power}', '#{arch_nemesis}');"
  db_conn.exec(sql)
end

def view
  prompt_user("Which superhero would you like to view?")
  db_conn.exec("SELECT * FROM superheroes WHERE superhero_name = #{name}")
end

def update
  update = prompt_user("Please enter the name of the hero you would like to update.")

  superhero_name = prompt_user("What is the hero's name?")
  alter_ego = prompt_user("What is the user's civilian alter ego?")
  response = prompt_user("Does this hero have a cape? (y/n)")
  if response == "y"
    has_cape? = true
  else
    has_cape? = false
  end
  power = prompt_user("What is this hero's special power?")
  arch_nemesis = prompt_user("Who is this hero's arch nemesis?"

  sql = "UPDATE superheroes SET superhero_name = #{superhero_name}, alter_ego = #{alter_ego}, has_cape? = #{has_cape?}, power = #{power}, arch_nemesis = #{arch_nemesis} WHERE #{superhero_name} = superhero_name"
  db_conn.exec(sql)

end

def remove
  delete = prompt_user("Please enter the name of the hero you would like to delete.")
  db_conn.exec("DELETE FROM superhoes WHERE superhero_name = #{delete}")
end

puts "Welcome to the Superhero Database!"

while true
  puts "Please select from the following choices."
  puts "(I) Index - List all Super Heroes, (C) Add a Super Hero, (R) View all info for a specific Super Hero, (U) Update a Super Hero, (D) Remove a Super Hero, (Q) Quit."
  resp = gets.chomp
  break if resp == "Q"

  case resp
  when "I"
    list()
  when "C"
    add()
  when "R"
    view()
  when "U"
    update()
  when "D"
    remove()
  end

end
