module ProjectsHelper
	def time_from_now(project)
		if project.pledging_done?
			content_tag(:strong, "All Done!")
		else
			time_ago_in_words(project[:pledging_ends_on]) + " remaining"
		end
	end
end
