class Turn
  include Mongoid::Document
  field :subject, type: String
  field :question, type: String

  belongs_to :user
end

