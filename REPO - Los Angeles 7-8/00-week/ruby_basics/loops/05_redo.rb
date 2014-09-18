# Redo

# Restarts this iteration of the most internal loop, without checking loop condition.

for i in 0..5
   if i < 2 then
      puts "Value of local variable is #{i}"
      redo
   end
end

# DO NOT RUN THIS. it is an infinite loop

# Value of local variable is 0
# Value of local variable is 0