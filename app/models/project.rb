class Project < ActiveRecord::Base
	def pledging_done?
		pledging_ends_on < Date.today
	end

	def self.active
		where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on")
	end
end
