class Game < ApplicationRecord
  belongs_to :parent
  belongs_to :team
  belongs_to :field
end
