class Team < ApplicationRecord
  belongs_to :player
  belongs_to :coaching_staff
end
