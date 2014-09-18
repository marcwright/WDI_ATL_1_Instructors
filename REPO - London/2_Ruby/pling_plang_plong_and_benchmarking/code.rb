require 'pry'

# def fizzbuzz(value)
#   output = ""
#   output << 'fizz' if value % 3 == 0
#   output << 'buzz' if value % 5 == 0
#   output.empty? ? value : output
# end

# def fizzbuzz_v2(value)
#   case
#   when value % 3 == 0 && value % 5 == 0
#     'fizzbuzz'
#   when value % 3 == 0
#     'fizz'
#   when value % 5 == 0
#     'buzz'
#   else
#     value
#   end
# end

#(1..100).each do |value|
#  puts fizzbuzz(value)
#end



## pling plang code below, fizz-buzz above


# def plingy?(value)
#   value % 3 == 0
# end

# def plangy?(value)
#   value % 5 == 0
# end

# def plongy?(value)
#   value % 7 == 0
# end

# def pling_plang_or_plong_v2(value)
#   output = ""
#   output << 'Pling' if value % 3 == 0
#   output << 'Plang' if value % 5 == 0
#   output << 'Plong' if value % 7 == 0
#   output.empty? ? value : output
# end

# def pling_plang_or_plong_v3(value)
#   case
#   when value % 3 == 0 && value % 5 == 0 && value % 7 ==0
#     'PlingPlangPlong'
#   when value % 3 == 0 && value % 7 ==0
#     'PlingPlong'
#   when value % 5 == 0 && value % 7 ==0
#     'PlangPlong'
#   when value % 3 == 0 && value % 5 == 0
#     'PlingPlang'
#   when value % 3 == 0
#     'Pling'
#   when value % 5 == 0
#     'Plang'
#   when value % 7 ==0
#     'Plong'
#   else
#     value
#   end
# end


def pling_plang_or_plong(value)
  plingplangplong = {
    3 => 'Pling', 
    5 => 'Plang',
    7 => 'Plong',
    }.map do |factor, noise|
      noise if value % factor == 0
    end
  plingplangplong.any? ? plingplangplong.join : value.to_s
end

def do_the_pling_plang
  (1..105).map do |value|
   pling_plang_or_plong(value)
  end
end
puts do_the_pling_plang.join(', ')

# binding.pry
exit

def jason
hash = {3=> "Pling", 5=> "Plang", 7=> "Plong"}
 
(1..100).each do |i|
  if i % 3 != 0 && i % 5 != 0 && i % 7 != 0
     i
  else
    hash.each do |number, drop|
      if i % number == 0
         drop
      end
    end
  end
  
end

end

def ben
range = (1..100)
range.each { |x| 
  if x % 3 == 0 or x % 5 == 0 or x % 7 == 0
    if x % 3 == 0 
      "pling"
    end
    if x % 5 == 0
      "plang" 
    end
    if x % 7 == 0
      "plong"
    end
    " "
  else
    "#{x} "
  end
}
end

def scotty
number=1
while number<=100
  if number%105==0
  ("PLING PLANG PLONG,")
  elsif number%35==0
          ("PLANG PLONG, ")
      elsif number%21==0
          ("PLING PLONG, ")
  elsif number%15==0
  ("PLING PLANG, ")
      elsif number%7==0
          ("PLONG, ")
      elsif number%3==0
          ("PLING, ")
      elsif number%5==0
          ("PLANG, ")
      else
           "#{number}, "
      end
      number=number+1
  end
end

def ppp_rec(i, nos)
    
    if i == (nos + 1) then 
       ""
    else  
 
      output = ""
 
      if i % 3 == 0
          output << "Pling"
      end
 
      if i % 5 == 0 
          output << "Plang"
      end
 
      if i % 7 == 0  
          output << "Plong"
      end
 
      if output == "" 
        output = i.to_s
      end  
 
      output << ","
       output
 
      ppp_rec(i + 1, nos)
 
    end
 
end

@mgp_pling = {}
(1..100).each do |i|
  @mgp_pling[i] = pling_plang_or_plong(i)
end

def mgp_faster_than_scotty
  (1..100).each do |i|
    @mgp_pling[i]
  end
end
 



# binding.pry
require 'benchmark'
Benchmark.bmbm do |b|
  b.report("MGP's Pling Plang Plong") do
    10000.times do
      do_the_pling_plang
    end
  end
  b.report("Ben's Pling Plang Plong") do
    10000.times do
      ben
    end
  end
  b.report("Scotty's Pling Plang Plong") do
    10000.times do
      scotty
    end
  end
  b.report("Mike's Pling Plang Plong") do
    10000.times do
      ppp_rec(1,100)
    end
  end
  b.report("Jason's Pling Plang Plong") do
    10000.times do
      jason
    end
  end
  b.report("BOOM! Pling Plang Plong") do
    10000.times do
      mgp_faster_than_scotty
    end
  end




  # b.report("v2") do
  #   # put stuff here
  # end
end
