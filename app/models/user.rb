class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :identification_number, :last_name, :password_digest, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  
end
