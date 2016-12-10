class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item, class_name: 'Product'
end
