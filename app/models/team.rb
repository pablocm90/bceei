class Team < ApplicationRecord
  belongs_to :player, optional: true
  has_many :games
  has_many :trainings
  has_many :coach_functions
end
