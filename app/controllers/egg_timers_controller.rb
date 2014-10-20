class EggTimersController < ApplicationController
  before_action :set_egg_timer, only: [:show, :edit, :update, :destroy]

  # GET /egg_timers
  # GET /egg_timers.json
  def index
    @egg_timers = EggTimer.all
  end

  # GET /egg_timers/1
  # GET /egg_timers/1.json
  def show
  end

  # GET /egg_timers/new
  def new
    @egg_timer = EggTimer.new
  end

  # GET /egg_timers/1/edit
  def edit
  end

  # POST /egg_timers
  # POST /egg_timers.json
  def create
    @egg_timer = EggTimer.new(egg_timer_params)

    respond_to do |format|
      if @egg_timer.save
        format.html { redirect_to @egg_timer, notice: 'Egg timer was successfully created.' }
        format.json { render :show, status: :created, location: @egg_timer }
      else
        format.html { render :new }
        format.json { render json: @egg_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /egg_timers/1
  # PATCH/PUT /egg_timers/1.json
  def update
    respond_to do |format|
      if @egg_timer.update(egg_timer_params)
        format.html { redirect_to @egg_timer, notice: 'Egg timer was successfully updated.' }
        format.json { render :show, status: :ok, location: @egg_timer }
      else
        format.html { render :edit }
        format.json { render json: @egg_timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /egg_timers/1
  # DELETE /egg_timers/1.json
  def destroy
    @egg_timer.destroy
    respond_to do |format|
      format.html { redirect_to egg_timers_url, notice: 'Egg timer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_egg_timer
      @egg_timer = EggTimer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def egg_timer_params
      params.require(:egg_timer).permit(:kind, :assign_time, :overdue_time)
    end
end
