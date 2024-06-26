class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
