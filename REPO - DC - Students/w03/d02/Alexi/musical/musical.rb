require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "admin",
  :password => "",
  :database => "musicals_db"
  )

class Musical < ActiveRecord::Base
end

# musical = Musical.create(title: "Guys and Dolls", year: 2000, composer: "Elton", lyricist: "Elton" )

class Song < ActiveRecord::Base
  has_many :songs
  has_many :performances
  has_many :characters, :through => :performances
end

#Song.create(title: "Circle of Life", musical_id: 7)


class Character < ActiveRecord::Base
  has_many :performances
  has_many :songs, :through => :performances
end

class Performance < ActiveRecord::Base
  belongs_to :song
  belongs_to :character

end

binding.pry
