class Admin::UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @roles = Role.all
    @users = User.order(:role_id)
  end

  def update
    @user.update_attributes(users_params)
    redirect_to admin_users_url
  end

  private

    def users_params
      params.require(:user).permit(:role_id)
    end

end
