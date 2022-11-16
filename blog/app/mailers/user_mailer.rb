class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  # will send email to user's registered email address
  def welcome_email
    @user = params[:user]
    @url = 'http://127.0.0.1:3000/login'
    attachments.inline['bmo.jpg'] = File.read(Rails.root.join('public/bmo.jpg'))
    mail(to: @user.email, subject: 'Welcome to my website')
  end
end
