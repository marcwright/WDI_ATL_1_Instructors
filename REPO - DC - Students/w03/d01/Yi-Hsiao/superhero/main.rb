require_relative "model"
require_relative "view"
require "pry"

class SuperHero
  def initialize
    # list of possible user options in the format:
    # key_to_select_option => { method: method_to_be_executed, text: text_to_be_displayed }
    @user_options = {
      I: { method: "view_all", text: "List all super heroes" },
      C: { method: "create", text: "Add a super hero" },
      R: { method: "view", text: "View all info for a specific super hero" },
      U: { method: "update", text: "Update a super hero" },
      D: { method: "delete", text: "Remove a super hero" },
      Q: { method: "quit", text: "Quit program" }
    }
    # creates a user menu with a Hash generated from the key and value[:text] in @menu_options
    @display = Display.new(Hash[@user_options.map { |key, value| [key, value[:text]] }])

    # if @run_program is false, the program will end
    @run_program = true

    # data
    @superhero_data = SuperHeroesData.new
  end

  def get_menu_choice
    # asks the user what they would like to do and then carries out the operation
    # goes back to the menu until the user chooses to quit the program

    while @run_program
      @display.print_menu
      user_response = gets.chomp.upcase.to_sym

      if @user_options.has_key?(user_response)
        send(@user_options[user_response][:method])
      else
        # if user selects an unexepcted response, show an error msg and the menu again
        puts "Sorry, I didn't understand that."
      end
    end
  end

  private
  def view_all
    # view all superheroes
    superhero_names = @superhero_data.get_all(["name"])
    if superhero_names.empty?
      @display.print("There are no super heroes yet.  Please add some.")
    else
      @display.print_values(superhero_names, "A list of all the super heroes: ")
    end
  end

  def create
    # starts a wizard to create a new super hero record

    super_hero = {}  # attributes of super hero to be created

    @display.print("What is the super hero's name?")
    super_hero[:name] = gets.chomp.split.map(&:capitalize).join(" ")

    @display.print("What is the super hero's alter ego?", "(Hit ENTER if there isn't one)")
    alter_ego_entry = gets.chomp
    super_hero[:alter_ego] = alter_ego_entry.split.map(&:capitalize).join(" ") unless alter_ego_entry.empty?

    @display.print("Does the super hero have a cape?", "(Enter Y or N)")
    super_hero[:has_cape] = gets.chr.upcase == "Y"

    @display.print("What powers does the super hero have?", "(Separate multiple powers with commas)")
    super_hero[:powers] = gets.chomp.split(/,\s/).map(&:downcase)

    @display.print("Who is their archnemesis?", "(Hit ENTER if there isn't one)")
    archnemesis_entry = gets.chomp
    super_hero[:archnemesis] = archnemesis_entry.split.map(&:capitalize).join(" ") unless archnemesis_entry.empty?

    # display success or failure
    if @superhero_data.add(super_hero)
      @display.print("You've added #{ super_hero[:name] } to the pantheon of super heroes!")
    else
      @display.print("#{ super_hero[:name] } is already in the history books.")
    end
  end

  def view
    @display.print("Which superhero do you want to view more details on?")
    requested_name = gets.chomp

    requested_hero_data = @superhero_data.get_all(["name", "alter_ego", "has_cape", "archnemesis"], "name ilike '#{ requested_name }'")
    @display.print_values(requested_hero_data)
  end

  def update
  end

  def delete
  end

  def quit
    @run_program = false
    @superhero_data.close
  end
end

SuperHero.new.get_menu_choice
