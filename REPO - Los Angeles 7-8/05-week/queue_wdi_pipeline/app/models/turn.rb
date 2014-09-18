class Turn
  include Mongoid::Document
  field :name, type: String
  field :subject, type: String
  field :question, type: String

  validates :name, presence: true
end
