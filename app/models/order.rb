class Order < ApplicationRecord
	belongs_to :user

	has_many :item_orders, dependent: :destroy
	has_many :items, through: :item_orders
	after_create :order_confirmation

	def order_confirmation
		UserMailer.order_confirmation(self.user_id, self).deliver_now
	end

end
