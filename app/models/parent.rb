class Parent < ApplicationRecord
  belongs_to :menage
  belongs_to :user, optional: true
  has_many :games
end
