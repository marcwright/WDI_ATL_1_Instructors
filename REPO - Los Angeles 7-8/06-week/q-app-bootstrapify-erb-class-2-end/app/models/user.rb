class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password

  field :name, type: String
  field :email, type: String
  field :github_handle, type: String
  field :password_digest, type: String
  field :is_admin, type: Boolean

  validates :name, presence: true

  validates :email, presence: true
  validates_uniqueness_of :email

  validates :github_handle, presence: true

  has_many :turns
end
