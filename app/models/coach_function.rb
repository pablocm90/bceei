class CoachFunction < ApplicationRecord
  belongs_to :teams
  has_many :coaches
end
