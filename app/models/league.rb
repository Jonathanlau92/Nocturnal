class League < ApplicationRecord
  has_many :matches
  has_many :teams, through: :matches
end
