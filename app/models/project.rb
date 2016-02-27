class Project < ActiveRecord::Base
	def pledging_done?
		pledging_ends_on < Date.today
	end
end
