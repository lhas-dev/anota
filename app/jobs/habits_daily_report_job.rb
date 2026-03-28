class HabitsDailyReportJob < ApplicationJob
  queue_as :default

  def perform
    date = Date.current
    User.joins(:habits).distinct.find_each do |user|
      HabitsMailer.daily_report(user, date).deliver_later
    end
  end
end
