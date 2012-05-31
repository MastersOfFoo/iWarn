class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
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
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User Profile was successfully updated.'
        format.html { }
        format.json { }
      end
    end
    redirect_to admin_path, :notice => "User was successfully updated!"
  end
  
  def destroy    
    @user = User.find(params[:id]).destroy
    redirect_to admin_path, :notice => "User was successfully destroyed!"
  end
  
end