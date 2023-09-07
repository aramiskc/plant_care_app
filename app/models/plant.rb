class Plant < ApplicationRecord
  has_many :schedules
  has_many :users, through: :schedules
  accepts_nested_attributes_for :schedules
end
