class Wizard < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :house, :is_muggle

	def full_name
		first_name.capitalize + " " + last_name.capitalize
	end

	def full_name_with_initial
		if middle_name == nil
			self.full_name
		else
			"#{first_name.capitalize} #{middle_name[0]}. #{last_name.capitalize}"
		end
	end
end
