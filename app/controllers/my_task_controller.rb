class MyTaskController < ApplicationController
  before_filter :authenticate_user!

  def mytasks
    @timers = EggTimer.all
    @plantasks = Plantask.associated_user(current_user).all
  	@tasks                    = @plantasks.order(:equip_number)
    @equipment_groups         = @plantasks.uniq.pluck(:equip_number)
    @daily_equipment_groups   = @plantasks.daily.assigned.uniq.pluck(:equip_number)
    @weekly_equipment_groups  = @plantasks.weekly.assigned.uniq.pluck(:equip_number)
    @monthly_equipment_groups = @plantasks.monthly.assigned.uniq.pluck(:equip_number)
    @yearly_equipment_groups  = @plantasks.yearly.assigned.uniq.pluck(:equip_number)
  end
end
