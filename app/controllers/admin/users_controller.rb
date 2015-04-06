class Admin::UsersController < ApplicationController

  def index
    if current_user.admin?  # TODO переделать в CanCan
      @roles = Role.all
      @users = User.all
    else
      flash[:alert] = "404 У вас нет прав!"
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def change
    if current_user.admin?  # TODO переделать в CanCan
      @user = User.find(params[:user][:id])
      @role = Role.find(params[:user][:role_id])

      @user.role = @role
      @user.save
      redirect_to admin_users_path
    else
      flash[:alert] = "404 У вас нет прав!"
      redirect_to root_url
    end
  end

end
