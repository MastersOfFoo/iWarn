module Admin
  class UsersController < ApplicationController  
    http_basic_authenticate_with :name => "admin", :password => "default"

    def index
      @users = User.all
    end
    
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, :notice => "New user added!"
      else
        flash[:error] = "This email is already registered, please use another one!"
        render "new"
      end
    end
    
    def destroy    
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_path, :notice => "User was successfully destroyed!"
    end

    private
    def user_params
      params[:user].slice(:email, :first_name, :identification_number, :last_name)
    end
  end
end