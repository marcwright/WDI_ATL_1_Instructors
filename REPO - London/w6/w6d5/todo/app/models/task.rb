class Task < ActiveRecord::Base

 attr_accessible :title, :description, :priority, :due_date, :today_task, :completed

default_scope order(:position)

  acts_as_list
end
