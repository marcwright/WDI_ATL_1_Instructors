module PagesHelper

	def yeface
		image_tag('http://livingcivil.com/wp-content/uploads/2013/09/Kanye-West-face-13.jpg')
	end

	def bs_link(link_name, link, type='default', size='lg')

		link_to(link_name, link, 
			class: 'btn btn-' + type + ' btn-'+ size 
			)
	end

end