class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, through: :orders

  attr_accessible :name

  validates :name, presence: true, uniqueness: true





