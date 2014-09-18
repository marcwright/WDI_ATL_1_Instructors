#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-14 16:04:00
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-14 16:05:35

class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :color
      t.integer :year
    end
  end
end
