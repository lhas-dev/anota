class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :habits, dependent: :destroy
  has_many :habit_trackings, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
