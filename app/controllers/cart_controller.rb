class CartController < ApplicationController
     after_action :authenticate_user!

  def show
    @cart = Cart.find_by(user: current_user)
      if @cart.items != nil
        @cart_items = CartItem.all.select {|cart_item| cart_item.cart == @cart}
      else 
        redirect_to root_path
        flash[:alert] = "Votre panier est tellement vide.. vous devriez le remplir, entre vous et moi"
    end
  end

  def destroy
    @cart = Cart.find_by(user: current_user)
    @cart.destroy
    flash[:notice] = "Commande supprimée"
    redirect_to administration_carts_path
  end



end
