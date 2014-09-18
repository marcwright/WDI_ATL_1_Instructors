class Book < ActiveRecord::Base
  belongs_to :author
  has_many :characters, dependent: :destroy

  validates :title, presence: true
end
