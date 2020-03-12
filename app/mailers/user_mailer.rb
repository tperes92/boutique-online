class UserMailer < ApplicationMailer
	default from: 'from@example.com'
	def order_confirmation(user_id, order)
		@user = User.find(user_id)
		@cart = Cart.where(user_id: @user.id).first
		@order = order
		@items = CartItem.where(cart_id: @cart.id)
		@url = 'https://fr.wikipedia.org/wiki/Chat'
		mail(to: @user.email, subject: 'Order Confirmation')
	end
end
