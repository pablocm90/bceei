class Coach < ApplicationRecord
  has_one :user
  belongs_to :coach_functions, optional: true
end
