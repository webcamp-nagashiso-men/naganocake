class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
   @end_user = EndUser.find(params[:id])
  end

  def edit
   @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if  @end_user.update(end_user_params)
    flash[:notice] = "User was successfully updated."
    end
  end

end
