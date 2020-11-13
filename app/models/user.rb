class User < ApplicationRecord
  include AASM
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[steam]
 
  has_many :user_teams
  has_many :teams, through: :user_teams
  has_many :profile_images
  has_many :images, through: :profile_images

  enum status: { no_pass: 0, purchased_pass: 1 }
  enum position: { hard_support: 0, soft_support: 1, offlane: 2, safe_lane: 3, mid_lane:4 }

  aasm column: :status, enum: true do
    state :no_pass, initial: true
    state :purchased_pass

    event :purchase do
      transitions from: :no_pass, to: :purchased_pass
    end

    event :expired do
      transitions from: :purchased_pass, to: :no_pass
    end
  end

  validate :password_regex

  after_create :send_welcome_mail

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      # authentication key is in devise.rb and it's password instead of email, since steam doesn't provide us the email
      user.username = auth.info['nickname']
      user.country = auth.info['location']
      user.profile_picture = auth.info['image']
      user.steam_id = (auth['uid'].to_i - 76561197960265728).to_s
      user.steam_authentication_data = auth.info
      user.password = Devise.friendly_token[0, 20]
      
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def link_account_from_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.username = auth.info['nickname']
    self.country = auth.info['location']
    self.profile_picture = auth.info['image']
    self.steam_id = (auth['uid'].to_i - 76561197960265728).to_s
    self.steam_authentication_data = auth.info
    self.save
  end

  def get_user_league_count
    count = 0
    self.teams.each do |team|
      count += team.leagues.count
    end
    return count
  end

  def get_current_league
    League.find_by(current_league: true)
  end

  def send_welcome_mail
    UserMailer.with(user: self).welcome.deliver_later
  end

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/
    errors.add :password, 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
