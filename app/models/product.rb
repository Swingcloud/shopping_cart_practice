class Product < ApplicationRecord
	belongs_to :category, counter_cache: true
	has_many :cart_items, foreign_key: 'item_id', dependent: :destroy
	has_many :carts, through: :cart_items
	has_many :order_items, dependent: :destroy
	has_many :comments, as: :commentable
	validates_presence_of :name, :price

	scope :active, ->{ where(active: true).where('shelved_on <= ?', Date.current)}

	def to_param
		"#{id}-#{friendly_id}"
	end
end
