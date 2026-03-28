class HabitTrackingsController < ApplicationController
  layout "dashboard"
  before_action :set_habit

  def create
    @habit.habit_trackings.find_or_create_by(
      user: Current.user,
      tracked_on: Date.current
    )
    redirect_to habits_tracker_index_path
  end

  def destroy
    @habit.habit_trackings.find_by(
      user: Current.user,
      tracked_on: Date.current
    )&.destroy
    redirect_to habits_tracker_index_path
  end

  private

  def set_habit
    @habit = Current.user.habits.find(params[:habit_id])
  end
end
