class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams
  has_many :matches
  has_many :leagues, through: :matches
end
