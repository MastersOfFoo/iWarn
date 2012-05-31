class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to welcome_path, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def welcome
  end
  
  def edit_user
    @user = User.find(params[:id])
  end
  
  def update_user
    @user = User.find(params[:id])
  end
  
  def destroy    
    @user = User.find(params[:id]).destroy
    redirect_to admin_path,:notice => "User was successfully destroyed!"
  end
  
end