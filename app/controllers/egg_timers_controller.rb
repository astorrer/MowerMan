class EggTimersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_egg_timer, only: [:show, :edit, :update, :destroy]

  def new
    @egg_timer = EggTimer.new
  end

  def edit
  end

  def create
    @egg_timer = EggTimer.new(egg_timer_params)

    respond_to do |format|
      if @egg_timer.save
        format.html { redirect_to libraries_path, notice: 'Egg timer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @egg_timer.update(egg_timer_params)
        format.html { redirect_to libraries_path, notice: 'Egg timer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @egg_timer.destroy
    respond_to do |format|
      format.html { redirect_to libraries_path, notice: 'Egg timer was successfully destroyed.' }
    end
  end

  private
    def set_egg_timer
      @egg_timer = EggTimer.find(params[:id])
    end

    def egg_timer_params
      params.require(:egg_timer).permit(:kind, :assign_time, :overdue_time)
    end
end
