class Coach < ApplicationRecord
  belongs_to :user
  belongs_to :coaching_staff
end
