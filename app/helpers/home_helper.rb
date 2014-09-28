module HomeHelper
	def sortableee(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "curret #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, params(:sort => column, :direction => direction, :page => nil)
	end
end