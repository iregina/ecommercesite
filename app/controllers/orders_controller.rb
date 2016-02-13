class OrdersController < ApplicationController
  include ApplicationHelper

  def index
    # @orders = Order.where _____
  end

  def create
    @order = Order.new(user_id: current_user.id)
  end

  def show
    @order = current_shopping_cart
  end

  def checkout
    @order = current_shopping_cart
    pass_the_id = @order.id
    @order.check_out
    # p "*********************************"
    # p @order
    # p @order.purchased_items.all
    # p @order.complete
    # p "*********************************"
    @order = Order.find(pass_the_id)
    if @order.complete
      flash[:success] = "You checked out successfully!"
    else
      flash[:error] = "Something went terribly wrong!"
      # "There is not enough in stock of one of the items you ordered (go figure out which one yourself), please edit the quantity in the shopping cart."
    end
    redirect_to '/'
    # redirect_to 'thank_you'
    # redirect_to checkout_path
  end

  # def thank_you

  # end

end


