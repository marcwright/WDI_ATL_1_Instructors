require 'pry'
require 'httparty'


# response = HTTParty.get("http://api.gamesradar.com/games?genre=shooter&api_key=579bd0ebcda04f60b4eceffafea3f915")
# game = HTTParty.get("http://api.gamesradar.com/game/16427?&api_key=579bd0ebcda04f60b4eceffafea3f915&api_secret=e3337ec8992e4cfa")
# game_name = HTTParty.get("http://api.gamesradar.com/search/gameName/pc/god+of+war?&api_key=579bd0ebcda04f60b4eceffafea3f915")

cv = HTTParty.get("http://www.giantbomb.com/api/search/?api_key=57c31f1066c13eaeaca445283b41bf9c39b9b753&format=json&query='civilization+IV'&resources=game&limit=5")
games = cv["results"]


# def view_game_info(list)
#   list.each do |game|
#     puts game["name"]
#     puts game["id"]
#       game["platforms"].each do |plat|
#         puts plat["name"]
#       end
#       if game['image']
#         puts game['image']["medium_url"]
#       end
#   end
# end


gb = HTTParty.get("http://www.giantbomb.com/api/game/#{games[1]["id"]}/?api_key=57c31f1066c13eaeaca445283b41bf9c39b9b753&format=json&field_list=genres,name,platforms,themes")


binding.pry




[["I want it all", 'all'], ["I need to be where the action is", 'action'], ["I'm going on an Adventure", 'adventure'], ["Quarters!", 'arcade'],
["My Kids are watching", 'children’s'], ["Fun for the Whole Family", 'family'], ["Kickpuncher!", 'fighting'], ["I Believe I can Fly!", 'flight'], ["Suprise Me", 'other games/compilations'], ["I'll Take the Case", 'puzzle'],
["Vrooooooom", 'racing'], ["Lightning Bolt!!!", 'role playing'], ["Pew Pew Pew", 'shooter'], ["Like real life, only not", 'simulation'], ["The Roar of the Crowd", 'sport+games'], ["A Brilliant Mind", 'strategy']]





<ul>
<% @user_games.each do |game| %>
<li>

  <%= link_to game.title + "?title=" + URI.encode(game.title), id: 'game_link' %>

</li>
<% end %>
</ul>
