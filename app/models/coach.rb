class Coach < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :coaching_staff
end
