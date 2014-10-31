module ApplicationHelper

	def active_page(path)
    "active" if current_page?(path)
  end
  
end
