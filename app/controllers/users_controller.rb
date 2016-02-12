class UsersController < ApplicationController
 protect_from_forgery
 include ApplicationHelper

 def create #post request
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to items_path
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def new #get new request
    @user = User.new
  end

  def update #put
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy #put
    @user = User.find(params[:id])
    @user.destroy

    redirect_to items_path
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
