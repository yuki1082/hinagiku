# encoding: utf-8

module ApplicationHelper
	def delete_link(object)
		link_to "削除", object, method: :delete, confirm: "Are you sure?"
	end 


end
