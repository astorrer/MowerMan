class LibrariesController < ApplicationController
  before_filter :authenticate_user!
  
  def library
    @area        = Area.order("number").page(params[:page_area]).per(8)
    @equipment   = Equipment.all.page(params[:page_equipment]).per(8)
    @part        = Part.all.page(params[:page_part]).per(8)
    @task_method = TaskMethod.all.page(params[:page_method]).per(8)
    @egg_timer   = EggTimer.all.page(params[:page_timer]).per(8)
  end
end
