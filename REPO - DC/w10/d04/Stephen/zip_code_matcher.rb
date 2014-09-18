#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-06-26 09:56:35
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-06-26 10:22:29

require 'pry'

valid = /(\A\d{5}\z)|(\A\d{5}-\d{4}\z)/
puts "valid: #{(valid.match(ARGV[0]) != nil)}"
