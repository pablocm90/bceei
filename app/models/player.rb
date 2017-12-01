class Player < ApplicationRecord
  belongs_to :user, optional: true
  has_many :teams
  belongs_to :menage, optional: true
end
