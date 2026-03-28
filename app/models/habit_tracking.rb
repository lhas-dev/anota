class HabitTracking < ApplicationRecord
  belongs_to :habit
  belongs_to :user

  validates :tracked_on, presence: true
  validates :habit_id, uniqueness: { scope: :tracked_on }
end
