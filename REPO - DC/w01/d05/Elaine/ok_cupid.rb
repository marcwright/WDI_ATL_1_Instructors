require 'pry'

ok_cupidites = {
  "nicestGuy5530" => {
    :name => "Brad Ladd",
    :in_a_relationship => false,
    :hobbies => ["working out", "seeing concerts", "watching sports", "eating"],
    :seeking => ["friendship", "short-term dating", "a long-term relationship", "anything I can get"]
  },
  "southwesternDave" => {
    :name => "Dave Tacoma",
    :in_a_relationship => false,
    :hobbies => ["bird watching", "cross-country skiing", "When I'm bored I do this thing I call 'friendly' prank calls, where I just call strangers and kinda ask them how they're doing and stuff, in a friendly way"],
    :seeking => ["a long-term relationship", "short-term dating"]
  },
  "WOOTman" => {
    :name => "Jeff Lamplugh",
    :in_a_relationship => true,
    :hobbies => ['improvisational comedy', 'aquacizing', 'private investigation'],
    :seeking => []
  }
}


# Use pry to return an array of keys for the ok_cupidites hash.
puts "Answer 1"

ok_cupidites.keys




# Use pry to return whether southwesternDave is in a relationship.

if ok_cupidites["southwesternDave"][:in_a_relationship] == "true"
  puts "Yes, he is."
else
  puts "No, he isn't"
end


# Use pry to add watching True Detective to WOOTman's hobbies.

ok_cupidites["WOOTman"][:hobbies].push("watching True Detective")


# Use pry to return all the things that nicestGuy5530 is seeking.

ok_cupidites["nicestGuy5530"][:seeking]

# Use pry to retrieve southwesternDave's third hobby.

ok_cupidites["southwesternDave"][:hobbies][2]

# In English, explain how would you return an array of only the ok_cupities that are single?

single_ok_cupidites = ok_cupidites.map do |ok_cupidite|
  ok_cupidites[ok_cupidite][:in_a_relationship] == "false"
end

binding.pry

