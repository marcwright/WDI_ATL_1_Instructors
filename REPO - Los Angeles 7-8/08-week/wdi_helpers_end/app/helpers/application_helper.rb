module ApplicationHelper

	def ye_er(name)

		if name[-1] == 'y'
			name.chop + 'ye'
		else
			name + 'ye'
		end

	end

end
