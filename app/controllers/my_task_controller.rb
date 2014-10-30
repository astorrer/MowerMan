class MyTaskController < ApplicationController
  before_filter :authenticate_user!

  def mytasks
    @timers    = EggTimer.all
    @plantasks = Plantask.associated_user(current_user).all
  	@tasks     = @plantasks.order(:equip_number)
  end
end
