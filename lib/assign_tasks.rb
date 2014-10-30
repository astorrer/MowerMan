class AssignTasks
  require 'time_difference'
  def self.all_tasks
    time = Time.now

    @egg_timers = EggTimer.all

    @egg_timers.each do |timer|
      @plantasks = timer.plantasks
      @plantasks.each do |task|
        unless task.records.blank?
          minutes_passed = TimeDifference.between(task.records.last.updated_at, time).in_minutes
          if minutes_passed > timer.assign_time
            task.assigned_switch = true
            task.overdue         = true if minutes_passed > timer.overdue_time
            if task.overdue
              task.overdue_count += 1
            end
          else
            task.overdue         = false
            task.overdue_count   = 0
            task.assigned_switch = false
          end
        end

        task.save!

      end
    end
  end
end