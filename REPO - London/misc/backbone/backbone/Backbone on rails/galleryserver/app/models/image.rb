class Image < ActiveRecord::Base
  belongs_to :album
  attr_accessible :title, :url, :album_id
end
