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

  def available_numbers(player)
    (0..99).to_a - players.pluck(:number)
  end
end
