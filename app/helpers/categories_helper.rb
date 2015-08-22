# encoding: utf-8
module CategoriesHelper
	def links_for(category)
		links = Array.new
		links << link_to("修正", [:edit, category])
		links << delete_link(category)
		raw(links.join(" "))
	end 
end
