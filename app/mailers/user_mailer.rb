class UserMailer < ApplicationMailer
  def welcome
    @user = params[:user]
    @url  = 'http://nocturnal-staging.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Nocturnal')
  end
end
