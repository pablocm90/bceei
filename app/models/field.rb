class Field < ApplicationRecord
  has_many :trainings
  has_many :games

end
