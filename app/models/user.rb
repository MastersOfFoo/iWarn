require "securerandom"

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  before_validation :set_default_password, :on => :create
  after_create :deliver_confirmation_email

  private
  def set_default_password
    self.password = self.password_confirmation = SecureRandom.hex[0..5]
  end
end
