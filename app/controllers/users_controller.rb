class UsersController < ApplicationController
  def index
    render "welcome"
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        redirect_to admin_path, :notice => "User was successfully updated!"
      else
        render "edit"
      end
    end  
  end

  private
  def user_params
    params[:user].slice(:email, :first_name, :identification_number, :last_name)
  end
end
