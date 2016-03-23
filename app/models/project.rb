class Project < ActiveRecord::Base

	validates :name, :description, presence: true

	validates :description, length: { maximum: 500 }

	validates :target_pledge_amount, numericality: { greater_than: 0 }

	validates :website, allow_blank: true, format: {
		with: /https?:\/\/[\S]+\b/i,
		message: 'must have a valid URI'
	}

	validates :image_file_name, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

	def pledging_done?
		pledging_ends_on < Date.today
	end

	def self.active
		where("pledging_ends_on >= ?", Time.now).order("pledging_ends_on")
	end
end
