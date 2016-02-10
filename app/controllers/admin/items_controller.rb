class Admin::ItemsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"

  def index
    @items = Item.all
  end

  def create #post request
    @item = Item.new(item_params)
    # p @item
    # p item_params

    if @item.save
      p @item
      redirect_to "/admin/items/#{@item.id}"
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new #get new request
    @item = Item.new
  end

  def edit #get request
    @item = Item.find(params[:id])
  end

  def update #put
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to "/admin/items/#{@item.id}"
    else
      render 'edit'
    end
  end

  def destroy #put
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "You have deleted the item successfully."
      redirect_to admin_items_path
    else
      flash[:error] = "Sorry you are having a bad day. It did not delete."
      redirect_to admin_items_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end

private
def item_params
  # p params
  # only takes in this specific paramater
  # if you p out params then makes item as the key item with has with all parameters (another hash)
  params.require(:item).permit(:title, :price, :description, :user_id, :quantity)
end

