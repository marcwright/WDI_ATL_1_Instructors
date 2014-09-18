# Healthcare.gov

response = HTTParty.get("https://community-healthcaregov.p.mashape.com/what-is-the-health-insurance-marketplace.json")
headers: {
    "X-Mashape-Authorization" => "<mashape-key>"
  }
response_hash = JSON(response)

#Metacritic

response = HTTParty.get("https://byroredux-metacritic.p.mashape.com/details?url=http%3A%2F%2Fwww.metacritic.com%2Fgame%2Fplaystation-3%2Fthe-elder-scrolls-v-skyrim")
headers: {
    "X-Mashape-Authorization" => "<mashape-key>"
  }
response_hash = JSON(response)

#MusiXmatch - lyrics

response = HTTParty.get("https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/album.get?album_id=13881272")
headers: {
    "X-Mashape-Authorization" => "<mashape-key>"
  }
response_hash = JSON(response)
