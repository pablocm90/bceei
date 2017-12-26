class Team < ApplicationRecord
  belongs_to :player, optional: true
  has_many :games
  has_many :trainings
  has_many :coach_functions

  def players
    Player.where(team_id: self.id)
  end

  def players_ordered
    players.order(:number)
  end
end
