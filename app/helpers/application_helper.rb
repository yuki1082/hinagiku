#coding: utf-8
module ApplicationHelper
	def delete_link(object)
		link_to "削除", object, method: :delete, confirm: "Are you sure?"
	end 

	def links_for(task)
		links = Array.new
		links << link_to("修正", [:edit, task])
		if task.done? 
			links << link_to("戻す", [:restart, task], method: :put)
		else
			links << link_to("完了", [:finish, task], method: :put)
		end 
		links << delete_link(task)
		raw(links.join(" "))
	end 
end
