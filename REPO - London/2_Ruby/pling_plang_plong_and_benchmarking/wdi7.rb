require 'pry-byebug'

require_relative 'mgp'

# puts do_the_pling_plang.join(', ')

def alex
  for num in [1..105]

    num.each { |x|
      if x % 3 == 0 && x % 5 == 0 && x % 7 == 0
       "PlingPlangPlong, "
     elsif x % 3 == 0 && x % 5 == 0
       "PlingPlang, "
     elsif x % 5 == 0 && x % 7 == 0
       "PlangPlong, "
     elsif x % 3 == 0 && x % 7 == 0 
       "PlingPlong, "
     elsif x % 3 == 0
       "Pling, "
     elsif x % 5 == 0
       "Plang, "
     elsif x % 7 == 0
       "Plong, "
     else
       "#{x}, "
     end
   }

 end
end



def toby
  (1..105).each do |x|
    y = 0
    if x % 3 == 0
     "pling"
     y += 1
   end
   if x % 5 == 0
     "plang"
     y += 1
   end
   if x % 7 == 0
     "plong"
     y += 1
   end
   if y == 0
     x
   end
   ", "
 end
end

def james
  "1, 2, Pling, 4, Plang, Pling, Plong, 8, Pling, Plang, 11, Pling, 13, Plong, PlingPlang, 16, 17, Pling, 19, Plang, PlingPlang, 22, 23, Pling, Plang, 26, Pling, Plong, 29, PlingPlang, 31, 32, Pling, 34, PlangPlong, Pling, 37, 38, Pling, Plang, 41, PlingPlong, 43, 44, PlingPlang, 46, 47, Pling, Plong, Plang, Pling, 52, 53, Pling, Plang, Plong, Pling, 58, 59, PlingPlang, 61, 62, PlingPlong, 64, Plang, Pling, 67, 68, Pling, PlangPlong, 71, Pling, 73, 74, PlingPlang, 76, Plong, Pling, 79, Plang, Plang, Pling, 82, 83, PlangPlong, Plang, 86, Pling, 88, 89, PlingPlang, Plong, 92, Pling, 94, Plang, Pling, 97, Plong, Pling, Plang, 101, Pling, 103, 104, PlingPlangPlong"
end

def gareth
  (1..105).each do |x|
    if x != 0 
      if x % 3 == 0 
        if x % 5 == 0
          if x % 7 == 0
            y = "PlingPlangPlong"
          else
            y = "PlingPlang"
          end

        else
          y = "Pling"  
        end
      else 
        if x % 5 == 0
          if x % 7 == 0
            y =  "PlangPlong"
          else
            y =  "Plang"
          end
        else
          if x % 7 == 0
            y =  "Plong"
          else 
            y = x
          end
        end
      end
      y
    end
  end
end



require 'benchmark'

Benchmark.bmbm do |b|
  b.report("MGP's code") do
    10000.times do
      do_the_pling_plang
    end
  end
  b.report("Alex's code") do
    10000.times do
      alex
    end
  end
  b.report("Toby's code") do
    10000.times do
      toby
    end
  end
  b.report("Gareth's code") do
    10000.times do
      gareth
    end
  end
  b.report("James' code") do
    10000.times do
      james
    end
  end
  b.report("Super fast code") do
    10000.times do
      mgp_super_fast
    end
  end




end




















