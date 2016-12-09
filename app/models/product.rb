class Product < ApplicationRecord
	belongs_to :category
	validates_presence_of :name, :price

	scope :active, ->{ where(active: true).where('shelved_on <= ?', Date.current)}

	def to_param
		"#{id}-#{friendly_id}"
	end
end
