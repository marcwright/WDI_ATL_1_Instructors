require 'pry-byebug'

require_relative 'mgp'

# puts do_the_pling_plang.join(', ')

# puts mgp_super_fast

# exit


def emma
  for i in 1..105

   "pling" if i%3 == 0
   "plang" if i%5 == 0
   "plong" if i%7 == 0
   i.to_s if i%7 != 0 && i%5 != 0 && i%3 != 0
   " "

 end
end

def shehryar
  1.upto(105) do |x|

    case
    when x % 3 ==0 && x % 5 ==0 && x % 7 ==0
     "PlingPlangPlong ,"
   when x % 3 ==0 && x % 5 ==0
     "PlingPlang ,"
   when x % 3 ==0 && x % 7 ==0
     "PlingPlong ,"
   when x % 5 ==0 && x % 7 ==0
     "PlangPlong ,"    
   when x % 3 ==0
     "Pling ,"
   when x % 5 ==0
     "Plang ,"
   when x % 7 ==0
     "Plong ,"
   else
     "#{x} ,"
   end
 end

end

def colin
  (1..105).each do |num|
    case
    when num % 3 == 0 && num % 5 == 0 && num % 7 == 0
     "pling-plang-plong"
   when num % 3 == 0 && num % 5 == 0
     "pling-plang"
   when num % 5 == 0 && num % 7 == 0
     "plang-plong"
   when num % 3 == 0 && num % 7 == 0
     "pling-plong"
   when num % 7 == 0
     "plong"
   when num % 5 == 0
     "plang"
   when num % 3 == 0
     "pling"
   else
     num
   end
   ", " unless num == 105
 end

end

def laurence
 for num in 1..105
   if num % 3 == 0 && num % 5 == 0 && num % 7 == 0
     print 'PlingPlangPlong, '
   elsif num % 3 == 0 && num % 5 == 0
     print 'PlingPlang, ' 
   elsif num % 3 == 0 
     print 'Pling, '
   elsif num % 5 == 0 
     print 'Plang, '
   elsif num % 7 == 0 
     print 'Plong, '
   else  
     print "#{num}, " 
   end
 end

end

def kate(number)

 "*** WELCOME GUEST ***"

 while number == 0
  print "Give me a number: "
  number = gets.chomp.to_i
  if number == 0
    print "You idiot! Give us a proper number: "
  end
end

result = case
when number % 3 == 0 && number % 5 == 0 && number % 7 == 0 then "PlingPlangPlong"
when number % 3 == 0 && number % 5 == 0 then "PlingPlang"
when number % 3 == 0 && number % 7 == 0 then "PlingPlong"
when number % 5 == 0 && number % 7 == 0 then "PlangPlong"
when number % 3 == 0 then "Pling"
when number % 5 == 0 then "Plang"
when number % 7 == 0 then "Plong"
else number
end

result
end




require 'benchmark'
Benchmark.bmbm do |b|
  b.report("MGP's pling") do
    10000.times do
      do_the_pling_plang
    end
  end

  b.report("Emma's pling") do
    10000.times do
      emma
    end
  end

  b.report("Shehryar's pling") do
    10000.times do
      shehryar
    end
  end

  b.report("Colin's pling") do
    10000.times do
      colin
    end
  end

  b.report("Kate's pling") do
    10000.times do
      (1..105).each do |i|
        kate(i)
      end
    end
  end

  b.report("BOOM!") do
    10000.times do
      mgp_super_fast
    end
  end

  b.report("OO?") do
    10000.times do
      mgp_oo
    end
  end


end
























