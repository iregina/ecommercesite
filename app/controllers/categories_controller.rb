class CategoriesController < ApplicationController

# display all the categories, clickable
  def index
    @categories = Category.all
  end

# display a single Catgory and all the Items associated
# later: use partials for rendering
  def show
    @category = Category.find(params[:id])
  end

end
