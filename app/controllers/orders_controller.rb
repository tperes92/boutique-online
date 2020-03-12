class OrdersController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 0
    @order = Order.new(user: current_user, cart: current_user.cart)
    @order.items.each do |item|
      @amount += item.price
    end
    @order.amount = @amount

    if @order.save

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount * 100,
        description: 'Paiement Cat Eye',
        currency: 'eur',
      })

    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end

end
