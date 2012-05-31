class AdminController < ApplicationController
  require "securerandom"
  http_basic_authenticate_with :name => "admin", :password => "default"
  def index
    @users = User.all
  end
  
  def add_new_user
    @user = User.new(params[:user])

  end
  
  def create_new_user
    @user = User.new(params[:user])
    password = SecureRandom.hex[0..5]
    @user.password = password
    @user.password_confirmation = password
    if @user.save
      MainMailer.added_as_a_user(@user.email,@user.first_name, password).deliver
      redirect_to admin_path, :notice => "New user added!"
    else
      redirect_to admin_path, :notice => "This email is already registered, please add another one!"
    end
  end
  
end
