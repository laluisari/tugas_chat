class UserMailer < ActionMailer::Base
    default :from => "me@mydomain.com"
    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.nama} <#{user.email}>", :subject => "Registration Confirmation")
    end
end
