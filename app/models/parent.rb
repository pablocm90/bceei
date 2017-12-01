class Parent < ApplicationRecord
  belongs_to :menage
  has_one :user
  has_many :games
end
