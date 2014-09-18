class Event < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue

  validates :band, presence: true
  validates :venue, presence: true
  validates :date_time, presence: true

  validate :concert_is_in_the_future, on: :create
  validate :does_not_violate_venues_profanity_rules

  private
  def concert_is_in_the_future
    errors.add(:date_time, "A new concert must be in the future.") if Date.today > date_time
  end

  def does_not_violate_venues_profanity_rules
    unless venue.allows_explicit_lyrics
      errors.add(:venue, "This venue does not allow explicit lyrics.") if band.has_explicit_lyrics
    end
  end
end
