#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-12 13:53:09
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-12 13:59:11

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "clowns_db"
)
