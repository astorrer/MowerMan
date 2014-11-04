class MyTaskController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_plantask
  
  def mytasks
    @timers    = EggTimer.all
  	@tasks     = @plantasks.order(:equip_number)
  end
  
  def set_plantask
    @plantasks = Plantask.associated_user(current_user).all
  end
end
