require 'net/http'

uri = URI.parse("https://auth.api.rackspacecloud.com")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new("/v1.1/auth")
request.add_field('Content-Type', 'application/json')
request.body = {'credentials' => {'username' => 'username', 'key' => 'key'}}
response = http.request(request)
