# ### Searching for a Soul Mate
# **Copy and paste the following into pry:**

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

# 1. Use pry to return an array of keys for the `ok_cupidites` hash.
ok_cupidites.keys
# 2. Use pry to return whether `southwesternDave` is in a relationship.
ok_cupidites["southwesternDave"][:in_a_relationship]
# 3. Use pry to add `watching True Detective` to `WOOTman`'s hobbies.
ok_cupidites["WOOTman"][:hobbies] << "watching True Detective"
# 4. Use pry to return all the things that `nicestGuy5530` is seeking.
ok_cupidites["nicestGuy5530"][:seeking]
# 5. Use pry to retrieve `southwesternDave`'s third hobby.
ok_cupidites["southwesternDave"][:hobbies][2]
# 6. In English, explain how would you return an array of only the ok_cupidites that are single?
ok_cupidites.select { |user, user_attr| !user_attr[:in_a_relationship] }
