class Admin::ItemsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret"

  def index
    @items = Item.all
  end

  def create #post request
    @item = Item.new(item_params)
    @categories = Category.all

    if @item.save
      @item.set_categories(params[:category]) if params[:category]
      redirect_to @item
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def new #get new request
    @item = Item.new
    @categories = Category.all
  end

  def edit #get request
    @item = Item.find(params[:id])
    @categories = Category.all
    @array =[]
  end

  def update #put
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
      # make sure this works! reminder
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
  params.require(:item).permit(:title, :price, :description, :user_id, :quantity, :categories => [])
end

