class CartItemsController < ApplicationController
  include CurrentCart
    before_action :set_cart, only: [:create]

  def index 
    @cart_items = CartItem.all
  end


  def show
  end

  def create 
    @item = Item.find_by(id: params[:item_id])
    @cart_item = CartItem.new(item: @item)
      if @cart_item.save 
      redirect_to root_path
      else
      redirect_to cart_items_path
      end
  end



end
