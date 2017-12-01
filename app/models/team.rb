class Team < ApplicationRecord
  belongs_to :player
  belongs_to :coaching_staff
  has_many :games
  has_many :trainings
end
