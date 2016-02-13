class PurchasedItemsController < ApplicationController
  include ApplicationHelper

  def show
  end

  def create
    p params
    order = current_shopping_cart
    purchase = Purchased_item.new(quantity: params[:quantity],
                        item_id: params[:item_id],
                        order_id: order.id)
    p purchase
    purchase.save
    redirect_to "/"
  end

end
