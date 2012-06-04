require "securerandom"

class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
  before_create :set_default_password
  after_create :deliver_confirmation_email

  private
  def set_default_password
    self.password = self.password_confirmation = SecureRandom.hex[0..5]
  end

  def deliver_confirmation_email
    MainMailer.added_as_a_user(self.email, self.first_name, self.password).deliver
  end
end
