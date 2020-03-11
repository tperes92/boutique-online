class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :cart

	def subtotal
		quantity * item.price
	end
end
