class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.sign_up(user.email, user.first_name, user.password).deliver
  end
end
