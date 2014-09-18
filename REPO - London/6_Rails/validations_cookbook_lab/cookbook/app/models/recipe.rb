class Recipe < ActiveRecord::Base
  attr_accessible :name, :instructions, :category_id, :description, :vegetarian

  belongs_to :category


end
