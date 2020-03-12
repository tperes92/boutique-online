class UsersController < ApplicationController

before_action :authenticate_user!, only: [:show]

  def show
  	
  	@cart = Cart.find_by(user: current_user)
  	@cart_items = CartItem.all.select {|cart_item| cart_item.cart == @cart}
    @user = User.find(current_user.id)

    if current_user.id != @user.id
      flash[:alert] = "Vous ne pouvez pas accéder à la page de profil d'un autre utilisateur."
      redirect_to root_path



    end
  end
  
end