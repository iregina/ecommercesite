class CategoriesController < ApplicationController

# display all the categories, clickable
  def index
    @categories = Category.all
  end

# display a single Catgory and all the Items associated
# refactor with a partial to show Items
  def show
    @category = Category.find(params[:id])
  end

end
