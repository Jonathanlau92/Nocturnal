# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def purchase_confirmation
    UserMailer.purchase_confirmation(User.first)
  end

  def team_details
    UserMailer.team_details(League.first, Team.first, User.first)
  end

  def check_in
    UserMailer.check_in(League.first, Team.first, User.first)
  end

  def actual_day
    UserMailer.actual_day(League.first, User.first)
  end
end
