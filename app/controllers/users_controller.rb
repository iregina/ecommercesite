class UsersController < ApplicationController
 helper SessionsHelper

 def create #post request
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
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
end

private
def user_params
  params.require(:user).permit(:name, :email, :password_hash)
end

#user_id???
