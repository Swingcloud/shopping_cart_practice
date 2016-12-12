class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item, class_name: 'Product'

	def subtotal
		quantity * item.price
	end
end
