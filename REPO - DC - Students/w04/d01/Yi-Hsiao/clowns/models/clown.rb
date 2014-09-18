require "active_record"

class Clown < ActiveRecord::Base
  validates_presence_of :name, :talent, :image_url
end
