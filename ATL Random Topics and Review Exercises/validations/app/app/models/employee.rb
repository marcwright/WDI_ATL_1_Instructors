class Employee < ActiveRecord::Base
  belongs_to :manager, class_name: 'Employee'
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"

  attr_accessible :name
end
