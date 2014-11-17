class WorkLoad
  def initialize(user_email)
    @tasks  = Plantasks.where(:associate => user_email)
    @timers = EggTimers.all
    @period = 525949
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
        if @timer.assign_time <= @period
        weights[timer.id] = (@period  / timer.assign_time)
      end
      return weights
    end
end