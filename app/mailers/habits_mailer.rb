class HabitsMailer < ApplicationMailer
  def daily_report(user, date)
    @user = user
    @date = date
    @habits = user.habits.order(:name)
    @tracked_habits = user.habit_trackings.where(tracked_on: date).includes(:habit)
    @tracked_habit_ids = @tracked_habits.pluck(:habit_id).to_set
    @completed = @habits.select { |h| @tracked_habit_ids.include?(h.id) }
    @missed = @habits.reject { |h| @tracked_habit_ids.include?(h.id) }
    @todays_score = @tracked_habits.sum(:score)
    @total_score = user.habit_trackings.sum(:score)

    mail(to: user.email_address, subject: I18n.t("habits_mailer.daily_report.subject"))
  end
end
