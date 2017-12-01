class Coach < ApplicationRecord
has_one :user
  belongs_to :coaching_staff
end
