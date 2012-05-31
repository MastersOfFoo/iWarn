class MainMailer < ActionMailer::Base
  
  default :from => "\"iWarn\"<no-reply@iWarn.com>" 

  def added_as_a_user (to)
   
    mail(:to => to, :subject => "iWarn - Congrats!" , :body => "You was successfully added as a user on iWarn, let's Rock dude!") 

  end
end