# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(User.first)
  end

  def purchase_confirmation
    UserMailer.purchase_confirmation(User.first)
  end

  def team_details
    UserMailer.team_details(League.first, Team.first, User.first)
  end

  def check_in
    UserMailer.check_in(User.first)
  end

  def actual_day
    UserMailer.actual_day(User.first)
  end
end
