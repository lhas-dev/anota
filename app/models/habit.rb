class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_trackings, dependent: :destroy

  validates :name, presence: true

  def tracked_on?(date)
    habit_trackings.exists?(tracked_on: date)
  end
end
