students = ["Adam Barrett","Jacob Cain","Mikael Davis","Salil Doshi","Jon Eva","Elaine Fang","Parker Hart","Richard Hessler","Mary Hipp","Inhak Kim","Randy Latz","Yi-Hsiao Liu","Alexi Phillipson","Matt Rundo","Gabe Snyder","Stephen Stanwood","Joella Straley","Brett Wallace","Thomas Weaver"]

#Comment that students is an array

#print "#{student name} is learning to learn."
#Will use: puts and asyn and .each for students array

students.each do |name|
  puts "#{name} is learning to learn. "
end

#print student name and index value in sentence

students.each_with_index do |name, index|
  puts "#{name} is number #{index} in the class. "
end
