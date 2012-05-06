class UserMailer < ActionMailer::Base
  default :from => "calderivan@gmail.com"
 
  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    @url  = "http://localhost:3000/signin"
    attachments['xsoftware_logo.png'] = File.read(Rails.root.join('public', 'images', 'xsoftware_logo.png'))
       mail(:to => email_with_name, :subject => "Welcome botanaX")
  end
end