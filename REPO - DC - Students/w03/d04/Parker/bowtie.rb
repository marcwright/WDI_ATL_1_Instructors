# require 'bowtie'

# map "/admin" do
#   BOWTIE_AUTH = {:user => 'admin', :pass => '12345'}
#   run Bowtie::Admin
# end

# map '/' do
#   run MyApp
# end

require 'sinatra'
require 'sinatra/reloader'
require 'pry'


get '/' do
  haml :index
end

__END__

@@ layout
%html
  = yield

@@ index
%div.title Hello world.



