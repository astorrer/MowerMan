class WorkLoad
  def initialize(user_email, period)
    @tasks  = Plantasks.where(:associate => user_email)
    @timers = EggTimers.all
    @period = period
  end

  def utilized_time
    timer_weights.each do |id, weight|
      @tasks.where(:egg_timer_id => id).each do |task|
        utilized = utilized + (task.estimated_time * weight)
      end
    end
    return utilized
  end

  def utilized_percentage
    return ( utilized_time / @period ) * 100 
  end

  private

    def timer_weights
      weights = Hash.new
      @timers.each do |timer|
        weights[timer.id] = (@period  / timer.assign_time)
      end
      return weights
    end
end


#period = 525949

  #def self.associate_workload
    # Find the average yearly workload of all tasks based upon a 40 hour workweek
    # Note: This is a dangerous hack. Please fix imediently. 
   # avl_time = 480
    #daily = self.daily.sum(:est_time)
#  #  daily = daily * 270
#    weekly = self.weekly.sum(:est_time)
#    weekly = weekly * 54
#    monthly = self.monthly.sum(:est_time)
#    monthly = monthly * 12
#    yearly = self.yearly.sum(:est_time)
#    total = ( daily + weekly + monthly + yearly )
#    total = total / 270
#    workload = ((total.to_f / avl_time.to_f ) * 100 ).round.to_s
#    return workload
#  end