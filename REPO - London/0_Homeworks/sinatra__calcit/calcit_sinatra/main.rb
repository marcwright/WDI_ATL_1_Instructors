require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'

get '/' do
  erb :home
end

get '/simple' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator].to_s

  @result = case @operator
    when '+' then
    @first + @second
    when '-' then
    @first - @second
    when '*' then
    @first * @second
    when '/' then
    @first / @second
    end
  erb :simple
end


get '/advanced' do
  @type = params[:type].to_s
  @first = params[:first].to_f
  @second = params[:second].to_f
  @square = params[:square].to_f

  if @type == 'sqrt' then
    @result = Math.sqrt(@square)
  elsif @type == 'power' then
    @result = @first ** @second
  end
  
  erb :advanced
end

get '/mortgage' do
  if params[:loan]
    loan = params[:loan].to_i
    rate = params[:rate].to_f/100
    months = params[:months].to_i*12
    interest = (1+rate/12)**(12/12)-1
    capital = (1-(1/(1+interest))**months)/interest
    @result = (loan/capital).round(2)
  end

  erb :mortgage
end

get '/bmi' do

  if params[:height]
    @operation = params[:operation].to_s
    @height = params[:height].to_f
    @weight = params[:weight].to_f
    @result = ((@weight/(@height * @height))).round(2)
    if @operation == 'i'
      @result = (@result*703)
    end
  end

  erb :bmi
end

get '/trip' do

  if params[:distance]
    @distance = params[:distance].to_f
    @mpg = params[:mpg].to_f
    @cost = params[:cost].to_f
    @speed = params[:speed].to_f
    if @speed > 60
        @mpg = @mpg - ((@speed - 60)*2)
      end
    @time_driving = @distance / @speed
    @result = ((@cost/@mpg)*@distance).round(2)
  end

  erb :trip
end

get '/death' do
  if params[:age]
    @age = params[:age].to_f

    @result = (81 - @age)*365.25*24*60*60
  end
  
  erb :death
end

post '/navigate' do
  goto = case
  when params[:destination].downcase.include?('ortgag') 
    :mortgage
  when params[:destination].downcase.include?('bmi')
    :bmi
  when params[:destination].downcase.include?('trip')
    :trip
  when params[:destination].downcase.include?('death')
    :death
  when params[:destination].downcase.include?('simp')
    :simple
  when params[:destination].downcase.include?('adva')
    :advanced
  else
    :home
  end

  erb goto
end


