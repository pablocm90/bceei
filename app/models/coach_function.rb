class CoachFunction < ApplicationRecord
  belongs_to :teams, optional: true
  has_many :coaches
end
