class Event < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where(:venue_id, "%#{query}%")

  end
end
