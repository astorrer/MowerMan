class PlantasksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_plantask, only: [:show, :edit, :update, :destroy]

  def index
    @plantasks = Plantask.department(current_user.department_id).all.order(:equip_number)

    respond_to do |format|
      format.html
      format.xls { send_data(@plantasks.to_xls) }
      format.csv { send_data(@plantasks.to_xls) }
    end
  end

  def show
    @plantask = Plantask.find(params[:id])
    @records = @plantask.records.all.order(created_at: :desc).page(params[:page_records]).per(8)

    @orders = @plantask.work_orders.order(created_at: :asc)

    # Change the panel color based upon the tasks current status.
    if @plantask.current_status == 'GOOD'
      @panel_style = "panel-success"
    elsif @plantask.current_status == 'WARNING'
      @panel_style = "panel-warning"
    elsif @plantask.current_status == 'ALERT'
      @panel_style = "panel-danger"
    end

    respond_to do |format|
      format.html
      format.xls { send_data(@plantask.records.to_xls) }
      format.csv { send_data(@plantask.records.to_csv) }
      format.png  { render :qrcode => plantask_url(@plantask), :level => :h, :unit => 10, :offset => 10 }
      format.pdf do
        pdf = TaskSummaryReport.new(@plantask, view_context)
        send_data pdf.render, filename: "task#{@plantask.id}_for_#{@plantask.equip_number}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def new
    @plantask = Plantask.new(:current_status => 'GOOD', :department_id => current_user.department_id)
  end

  def edit
  end

  def create
    @plantask = Plantask.new(plantask_params)
    @plantask.assigned_switch = true
    @plantask.overdue_count = 0

    equip = Equipment.where(name: @plantask.equipment).pluck(:number)
    n = equip.to_s
    @plantask.equip_number = n.delete "[]"

    respond_to do |format|
      if @plantask.save
        format.html { redirect_to @plantask, notice: 'Your new task was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    
    respond_to do |format|
      if @plantask.update(plantask_params)
            equip = Equipment.where(name: @plantask.equipment).pluck(:number)
            n = equip.to_s
            @plantask.equip_number = n.delete "[]"
            @plantask.save!
        format.html { redirect_to @plantask, notice: 'Your task was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @plantask.destroy
    respond_to do |format|
      format.html { redirect_to plantasks_url }
    end
  end

  def edit_multiple
    if params[:plantask_ids].nil?
      redirect_to plantasks_path
    else
      @plantasks = Plantask.find(params[:plantask_ids])
    end
  end

  def edit_multiple_equipment
    if params[:plantask_ids].nil?
      redirect_to plantasks_path
    else
      @plantasks = Plantask.find(params[:plantask_ids])
    end
  end

  def update_multiple
    @plantasks = Plantask.update(params[:plantasks].keys, params[:plantasks].values)
    @plantasks.reject! { |p| p.errors.empty? }
    equip = Equipment.where(name: @plantask.equipment).pluck(:number)
    n = equip.to_s
    @plantask.equip_number = n.delete "[]"
    @plantask.save!
    if @plantasks.empty?
      redirect_to plantasks_path
    else
      render "edit_multiple"
    end
  end

  def update_multiple_equipment
    @plantasks = Plantask.update(params[:plantasks].keys, params[:plantasks].values)
    @plantasks.reject! { |p| p.errors.empty? }
    if @plantasks.empty?
      redirect_to plantasks_path
    else
      render "edit_multiple_equipment"
    end
  end

  private
    def set_plantask
      @plantask = Plantask.find(params[:id])
    end

    def plantask_params
      params.require(:plantask).permit(:equip_number, :area, :equipment, :part, :description, :ext_description, :data_type, :upper, :lower, :ext_upper, :ext_lower, :est_time, :current_status, :procedure, :target, :associate, :department_id, :egg_timer_id )
    end
end
