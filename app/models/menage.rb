class Menage < ApplicationRecord
  belongs_to :parent
  belongs_to :player
end
