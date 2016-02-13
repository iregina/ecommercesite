class PurchasedItemsController < ApplicationController
  include ApplicationHelper

  def show
  end

  def create
    p params
    order = current_shopping_cart
    purchase = PurchasedItem.new(quantity: params[:quantity],
                        item_id: params[:item_id],
                        order_id: order.id)
    p purchase
    purchase.save
    flash[:success] = "You purchased an item!"
    redirect_to "/orders/show"
  end

  def destroy
    @purchased_item = PurchasedItem.find(params[:id])
    @order = @purchased_item.order
    @purchased_item.destroy
    redirect_to order_path(@order)
  end


end
