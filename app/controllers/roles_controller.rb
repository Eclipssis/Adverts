class RolesController < ApplicationController

  def create
    @user = User.find(params[:user][:id])
    @role = Role.find(params[:user][:role_id])

    @user.role = @role
    @user.save
  end

  def change

  end

  def update

  end

end
