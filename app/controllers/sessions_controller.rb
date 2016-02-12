class SessionsController < ApplicationController

 include ApplicationHelper


  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'You logged in!'
      login(user)
      redirect_to root_url
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # flash.now[:logout] = 'You logged out'
    logout!
    redirect_to root_url
  end

end
