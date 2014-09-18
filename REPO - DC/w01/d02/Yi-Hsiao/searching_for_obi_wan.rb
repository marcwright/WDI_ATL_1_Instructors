class Droid
  attr_reader :name

  def initialize name, gender
    @name = name  # droid's name
    @gender = gender.downcase # m or f
  end

  def add_companion partner
    # add a companion to the droid's party
    @partner = partner
  end

  def greet_person
    # ask for the user's name and returns the capitalized string
    puts "Hi, I'm #{@name}, human-cyborg relations."
    puts "Hello, whom am I speaking to?"
    gets.chomp.capitalize
  end

  def is_it_true? question, poss_answers
    # asks a question to the user
    # only accepts certain answers, where the first element is the true value

    puts "#{question} (#{poss_answers.join("/")})?"
    answer = gets.chomp.upcase
    upcase_answers = poss_answers.map &:upcase

    if upcase_answers.include? answer
      answer == upcase_answers[0] ? true : false
    else
      puts "Sorry, I didn't understand you."
      is_it_true? question, poss_answers
    end
  end

  def say_farewell
      puts "(Say your farewells.)"
      puts "#{gets.chomp.capitalize} to you too."
      puts "Well #{@partner.name}, I suppose we'll just have to keep looking."
      puts "#{@partner.name}: (Agreeable droid noises)"
  end

  def looking_for missing_person
    person_name = greet_person
    puts "It is a pleasure to meet you, #{person_name}."

    met_a_droid = is_it_true? "Have you ever met a protocol droid before", ["Y", "N"]
    puts "#{met_a_droid ? "Yes" : "No"}? How interesting for someone around these parts."
    found_the_person = is_it_true? "I'm terribly sorry for prying, but you don't by any chance go by the alias of #{missing_person}, do you", ["I do", "I don't"]

    if found_the_person
      print "Oh, marvelous! Simply marvelous! "
      puts "Say hello to #{@partner.name}; he's been looking all over for you." if @partner
    else
      puts "I've really enjoyed speaking with you, #{person_name}, but if you'll please excuse me, I have to help my friend find someone named #{missing_person}."
      say_farewell
    end
  end
end

c3po = Droid.new "C-3PO", "m"
r2d2 = Droid.new "R2-D2", "m"
c3po.add_companion r2d2
c3po.looking_for "Obi-Wan Kenobi"
