class CategoriesController < ApplicationController

# display all the categories, clickable
  def index
    @categories = Category.all
  end

# display a single Catgory and all the Items associated
  def show
    @category = Category.find(params[:id])
  end

end
