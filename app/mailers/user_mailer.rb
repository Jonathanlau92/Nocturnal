class UserMailer < ApplicationMailer
  default from: "projectnocturnaldev@gmail.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Registration Confirmation')
  end

  def purchase_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Purchase Confirmation')
  end

  def team_details(league, team, user)
    @league = league
    @members = team.users.where.not(email: user.email)
    @user = user
    mail(to: @user.email, subject: 'Team Information Released')
  end

  def check_in(user)
    @user = user
    mail(to: @user.email, subject: 'Check-In Reminder')
  end

  def actual_day(user)
    @user = user
    mail(to: @user.email, subject: 'League Reminder')
  end
end
