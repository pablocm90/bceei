class Player < ApplicationRecord
  has_one :user
  has_many :teams
  belongs_to :menage, optional: true
  validates :number, uniqueness: {scope: :team_id}
  accepts_nested_attributes_for :user

end
