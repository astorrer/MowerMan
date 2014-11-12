class TaskHistory < ActiveRecord::Base
  
  def self.record_history
    history = self.new
    history.task_count = Plantask.count
    history.overdue_count = Plantask.overdue.count
    history.save
  end

  def self.average(date_1, date_2)
    history = Plantask.where("today >= date_1 AND today <= date_2")
    quantity_avg = history.task_count.sum / history.count
    overdue_avg = history.overdue_count.sum / history.count
    return (overdue_avg / quantity_avg) * 100
  end
end