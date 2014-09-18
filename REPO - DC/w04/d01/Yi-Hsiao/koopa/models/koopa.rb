require_relative "config"

class Koopa < ActiveRecord::Base
  validates_presence_of :name, :color, :photo_url
end
