class Parent < ApplicationRecord
  belongs_to :menage, optional: true
  has_one :user
  has_many :games
end
