module ProjectsHelper
	def time_from_now(project)
		if project.pledging_done?
			content_tag(:strong, "All Done!")
		else
			time_ago_in_words(project[:pledging_ends_on]) + " remaining"
		end
	end

	def image_for(project)
		if project.image_file_name.blank?
			image_tag 'placeholder.png'
		else
			image_tag project.image_file_name
		end
	end
end
