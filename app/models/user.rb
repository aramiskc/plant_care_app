class User < ApplicationRecord
  has_secure_password
  has_many :schedules
  has_many :plants, through: :schedules
end
