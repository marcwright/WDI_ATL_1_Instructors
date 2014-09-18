require 'pry'
require 'httparty'

response = HTTParty.get("http://api.gamesradar.com/games?genre=shooter&api_key=579bd0ebcda04f60b4eceffafea3f915")
game = HTTParty.get("http://api.gamesradar.com/game/20374?api_key=579bd0ebcda04f60b4eceffafea3f915")
game_name = HTTParty.get("http://api.gamesradar.com/search/gameName/pc/civ?api_key=579bd0ebcda04f60b4eceffafea3f915")

