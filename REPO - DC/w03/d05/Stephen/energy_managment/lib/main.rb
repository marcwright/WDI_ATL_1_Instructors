#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-09 10:10:54
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-09 10:38:03

require_relative 'Student'

def welcome
  puts "Welcome to the Energy Management Game!"
end

def farewell
  puts "Thanks for playing!"
end

def prompt_name
  print "What's your name? "
  return gets.chomp.split.map(&:capitalize).join(' ')
end

def prompt_option
  puts "(1) Code"
  puts "(2) Break"
  puts "(3) Plan"
  puts "(4) Quit"

  while true
    print "==> WHAT YOU CHOOSE (#): "
    resp = gets.chomp.to_i
    return resp if (1..4).include? resp
  end
end

welcome
s = Student.new(prompt_name)

while true
  case prompt_option
  when 1
    s.code
  when 2
    s.break
  when 3
    s.plan
  when 4
    break
  end

  puts
  puts s
end

farewell
