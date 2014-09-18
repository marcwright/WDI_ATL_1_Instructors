#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 15:43:56
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 15:46:14

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "coasters_db"
)
