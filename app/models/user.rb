class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[steam]
  # belongs_to :team

  def self.from_omniauth(auth)
  	puts "AUTH IS : #{auth}"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    	user.steam_authentication_data = auth.info
      # user.email = auth.info.email
      # user.password = Devise.friendly_token[0, 20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
