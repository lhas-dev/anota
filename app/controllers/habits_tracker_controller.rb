class HabitsTrackerController < ApplicationController
  layout "dashboard"

  def index
    @habits = Current.user.habits.order(:position, :name)
    @today = Date.current
    @todays_trackings = Current.user.habit_trackings.where(tracked_on: @today).index_by(&:habit_id)
    @todays_score = Current.user.habit_trackings.where(tracked_on: @today).sum(:score)
    @total_score = Current.user.habit_trackings.sum(:score)
  end

  def calendar
    @habits = Current.user.habits.order(:position, :name)
    @habit = Current.user.habits.find_by(id: params[:habit_id]) || @habits.first

    return unless @habit

    @year = (params[:year] || Date.current.year).to_i
    @month = (params[:month] || Date.current.month).to_i
    @date = Date.new(@year, @month, 1)
    @tracked_days = @habit.habit_trackings
      .where(tracked_on: @date.all_month)
      .pluck(:tracked_on)
      .to_set
    @days_in_month = @date.end_of_month.day
    @tracked_count = @tracked_days.size
  end
end
