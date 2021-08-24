class Public::EndUsersController < ApplicationController
  
 
  
  def show
    @end_user = EndUser.find(params[:id])
  end
  

  def out
    @end_user = EndUser.find(params[:id])
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def quit
      @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_users = EndUser.new
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user.id)
  end
  
  private

  def end_user_params
    params.require(:end_user).permit(:name_last, :name_first, :hurigana_last, :hurigana_first, :email, :postal_code, :address, :telephone_number)
  end
 
  end
 

