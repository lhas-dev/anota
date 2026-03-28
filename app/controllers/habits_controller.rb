class HabitsController < ApplicationController
  layout "dashboard"
  before_action :set_habit, only: [ :edit, :update, :destroy ]

  def index
    @habits = Current.user.habits.order(:position, :name)
  end

  def new
    @habit = Current.user.habits.build
  end

  def create
    @habit = Current.user.habits.build(habit_params)

    if @habit.save
      redirect_to habits_tracker_index_path, notice: t("habits.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)
      redirect_to habits_tracker_index_path, notice: t("habits.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    redirect_to habits_tracker_index_path, notice: t("habits.deleted")
  end

  def sort
    params[:habit_ids].each_with_index do |id, index|
      Current.user.habits.where(id: id).update_all(position: index)
    end
    head :ok
  end

  private

  def set_habit
    @habit = Current.user.habits.find(params[:id])
  end

  def habit_params
    params.require(:habit).permit(:name, :description, :color)
  end
end
