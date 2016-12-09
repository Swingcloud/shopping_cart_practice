class Product < ApplicationRecord
	belongs_to :category
	validates_presence_of :name, :price

	scope :active, ->{ where(active: true )}

	def to_param
		"#{id}-#{friendly_id}"
	end
end
