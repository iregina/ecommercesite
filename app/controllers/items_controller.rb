class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

# refactor with a partial
  def show
    @item = Item.find(params[:id])
  end
end

private
def item_params
  params.require(:item).permit(:title, :price, :description, :user_id, :quantity)
end


