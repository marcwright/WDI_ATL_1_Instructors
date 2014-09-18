require 'httparty'

# wmata key: ud7ahaty74qdc2ghs4h34y5g
# http://developer.wmata.com/docs/read/GetBusPrediction

response = HTTParty.get("http://api.wmata.com/NextBusService.svc/json/JPredictions?StopID=1001888&api_key=ud7ahaty74qdc2ghs4h34y5g")
@bus = JSON(response)

# http://developer.wmata.com/io-docs
