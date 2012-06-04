class UserMailer < ActionMailer::Base
  default :from => '"iWarn" <no-reply@iWarn.com>'

  def sign_up(to, name, password)
    @name = name
    @password = password
    mail(:to => to, :subject => "iWarn - Welcome!")
  end
end
