# UNTIL statement

# Syntax

until conditional [do]
   code
end

# An until statement executes code while the condition is FALSE

$i = 0
$num = 5

until $i > $num  do
   puts("Inside the loop i = #$i" )
   $i +=1;
end

