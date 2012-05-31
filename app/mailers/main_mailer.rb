class MainMailer < ActionMailer::Base
  
  default :from => "\"iWarn\"<no-reply@iWarn.com>" 

  def added_as_a_user (to, name, password)
    @name = name
    @password = password
    mail(:to => to, :subject => "iWarn - Congrats!" ) 
  end
end