class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :omniauthable, omniauth_providers: %i[steam]

  has_many :team_details
  has_many :teams, through: :team_details

  has_many :images
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      # authentication key is in devise.rb and it's password instead of email, since steam doesn't provide us the email
      user.username = auth.info['nickname']
    	user.steam_authentication_data = auth.info
      user.password = Devise.friendly_token[0, 20]
      
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
