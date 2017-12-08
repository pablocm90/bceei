class Team < ApplicationRecord
  belongs_to :player
  has_many :games
  has_many :trainings
  has_many :coach_functions
end
