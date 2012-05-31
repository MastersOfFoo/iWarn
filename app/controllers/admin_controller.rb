class AdminController < ApplicationController
  require "securerandom"
  http_basic_authenticate_with :name => "admin", :password => "default"
  def index
    @users = User.all
  end
  
  def add_new_user
    @user = User.new(params[:user])
    MainMailer.added_as_a_user(current_user.email).deliver
  end
  
  def create_new_user
    @user = User.new(params[:user])
    @user.password_digest = SecureRandom.hex[0..5]
    @user.password_confirmation = SecureRandom.hex[0..5]
    if @user.save
      redirect_to admin_path, :notice => "New user added!"
    else
      redirect_to admin_path, :notice => "This email is already registered, please add another one!"
    end
  end
  
end
