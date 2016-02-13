class OrdersController < ApplicationController
  include ApplicationHelper

  def create
    @order = Order.new(user_id: current_user.id)
  end

  def show
    @order = current_shopping_cart
  end

  def edit
    @order = Order.find(params[:id])
  end

end


