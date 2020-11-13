class UserMailer < ApplicationMailer
  default from: "projectnocturnaldev@gmail.com"

  def purchase_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Thank you for your purchase')
  end

  def team_details(league, team, user)
    @league = league
    @team = team
    @user = user
    mail(to: @user.email, subject: 'Team details are out!')
  end

  def check_in(league, team, user)
    @league = league
    @team = team
    @user = user
    mail(to: @user.email, subject: 'Check in details')
  end

  def actual_day(league, user)
    @league = league
    @user = user
    mail(to: @user.email, subject: 'League day reminder')
  end
end
