class Admins::UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @genre = Genre.all
  end

  def update
    @user = User.find(params[:id])
    if @user.user_status == true
      @user.update(user_status: false)
      redirect_back(fallback_location: root_path)
    else
      @user.update(user_status: true)
      redirect_back(fallback_location: root_path)
    end
  end


end
