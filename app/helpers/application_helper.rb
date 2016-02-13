module ApplicationHelper

  def login(user)
    session[:id] = user.id
  end

# call this method to bring up current open shopping cart
  def current_shopping_cart
    Order.where(user_id: current_user.id, complete: false).first_or_create
  end

  def logged_in?
    session[:id] != nil
  end

  # ANOTHER APPROACH:
  # current_user.present?
  # !!current_user

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

# ANOTHER APPROACH:
# @current_user ||= User.where(id: session[:id]).first

# clears just that session id
  def logout!
    session[:id] = nil
  end

  def is_admin?
    logged_in? && current_user.admin
  end

  def require_admin
    unless is_admin?
      flash[:error] = "Naughty child! You don't have permission to do that!"
      redirect_to '/'
    end
  end

end
