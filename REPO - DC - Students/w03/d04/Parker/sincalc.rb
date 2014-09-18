require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

# enable sessions 
enable :sessions
#Welcome visitors to the the calculator! <= Step 1

get '/' do
  code = "<%= Time.now %>"
  erb code
end

get '/' do
	hart = "WELCOME TO MY ONLINE CALCULATOR!"
	"<h1>#{hart}</h1>"
end

get '/' do
  pass if Time.now > time_for('Jan 23, 2014')
  "still time"
end
	# link = "http://localhost:4567/calculator"
	# "#{link}"


get '/calculator' do

'
<form action="/add" method="post" accept-charset="utf-8">
	<input type="text" name="num1" value="" id="num1"> +
	<input type="text" name="num2" value="" id="num2">
	<input type="submit" value="Add">
</form>
 
<form action="/subtract" method="post" accept-charset="utf-8">
	<input type="text" name="num1" value="" id="num1"> -
	<input type="text" name="num2" value="" id="num2">
	<input type="submit" value="Subtract">
</form>

<form action="/divide" method="post" accept-charset="utf-8">
	<input type="text" name="num1" value="" id="num1"> /
	<input type="text" name="num2" value="" id="num2">
	<input type="submit" value="Divide">
</form>

<form action="/multiply" method="post" accept-charset="utf-8">
	<input type="text" name="num1" value="" id="num1"> *
	<input type="text" name="num2" value="" id="num2">
	<input type="submit" value="Multiply">
</form>
'
end

# adding
post '/add' do
  "#{params[:num1]} plus #{params[:num2]} = #{params[:num1].to_i + params[:num2].to_i}
  <a href='/calculator'>Back</a>"
end

# subtracting 
post '/subtract' do
 "#{params[:num1]} minus #{params[:num2]} = #{params[:num1].to_i - params[:num2].to_i}
 <a href='/calculator'>Back</a>"
end

# dividing
post '/divide' do
 "#{params[:num1]} divide #{params[:num2]} = #{params[:num1].to_i / params[:num2].to_i}
 <a href='/calculator'>Back</a>"
end

# multiply
post '/multiply' do
 "#{params[:num1]} multiply #{params[:num2]} = #{params[:num1].to_i * params[:num2].to_i}
 <a href='/calculator'>Back</a>"
end




# __END__

# @@ layout
# %html
#   = yield

# @@ index
# %div.title Hello world.


