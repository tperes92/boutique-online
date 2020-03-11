class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: current_user)
    @cart_items = [CartItem.find_by(cart_id: @cart)]

  end

end
