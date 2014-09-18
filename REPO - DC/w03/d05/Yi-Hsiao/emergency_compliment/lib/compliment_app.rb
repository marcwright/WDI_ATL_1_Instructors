require "sinatra"
require "slim"
require "pry"

class ComplimentApp < Sinatra::Base
  # list of possible compliments that can be displayed
  @@compliments = [
    "Your instructors love you",
    "High five = ^5",
    "Is it Ruby Tuesday yet?",
    "It's almost beer o'clock",
    "The Force is strong with you"
  ]
  # list of possible background hexcodes that can be used
  @@hex_codes = ["7F", "BF", "FF"]

  # get random background_color
  def get_bg_color
    @@hex_codes.sample(3).join
  end

  get "/thank-you" do
    @rand_background = get_bg_color   # set a random background color for the page

    slim :thank_you
  end

  get "/*" do |name|
    # if a URL path is given, store that as the name the app will use to address the user
    # example: visiting /bruce/wayne => @name = "Bruce Wayne"
    names = name.split("/")
    unless names.empty?
      @name = names.map(&:capitalize).join(" ")
    end

    @rand_compliment = @@compliments.sample   # send a random compliment to the user
    @rand_background = get_bg_color           # set a random background color for the page

    slim :compliment
  end


  post "/add-compliment" do
    @new_compliment = params[:compliment]
    @@compliments << @new_compliment        # save the new compliment
    redirect "/thank-you"                   # redirect user to thank you page
  end
end
