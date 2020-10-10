class Team < ApplicationRecord
  has_many :team_details
  has_many :users, through: :team_details
  has_many :matches
  has_many :leagues, through: :matches
end
