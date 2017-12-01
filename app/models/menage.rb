class Menage < ApplicationRecord
  has_many :parents
  has_many :players

end
