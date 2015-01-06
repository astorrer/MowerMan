class UsersController < ApplicationController
  load_and_authorize_resource

  def assign_manager_role
    @user = User.find(params[:id])
    @user.add_role :manager
    redirect_to users_path
  end

  def demote_from_manager_role
    @user = User.find(params[:id])
    @user.remove_role :manager
    redirect_to users_path
  end

  def assign_admin_role
    @user = User.find(params[:id])
    @user.add_role :admin
    redirect_to users_path
  end

  def demote_from_admin_role
    @user = User.find(params[:id])
    @user.remove_role :admin
    redirect_to users_path
  end

  def activate_account
    @user = User.find(params[:id])
      @user.update(:active_account => true)
    redirect_to users_path
  end

  def deactivate_account
    @user = User.find(params[:id])
      @user.update(:active_account => false)
    redirect_to users_path
  end
end