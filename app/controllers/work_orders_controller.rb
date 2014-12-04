class WorkOrdersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  def index
    @work_orders = WorkOrder.all
    @incomplete_work_orders = WorkOrder.incomplete.all
  end

  def show
    # Change the panel color based upon the tasks current status.
    if @work_order.plantask.current_status == 'GOOD'
      @panel_style = "panel-success"
    elsif @work_order.plantask.current_status == 'WARNING'
      @panel_style = "panel-warning"
    elsif @work_order.plantask.current_status == 'ALERT'
      @panel_style = "panel-danger"
    end
  end

  def new
    @plantask = Plantask.find(params[:id])
    @work_order = @plantask.work_orders.build(:urgency => '1', :department_id => current_user.department_id) 
  end

  def edit
  end

  def create
    @plantask = Plantask.find(params[:id])
    @work_order = @plantask.work_orders.build(work_order_params)    
    @work_order.completion_switch = false

    respond_to do |format|
      if @work_order.save
        format.html { redirect_to work_orders_url, notice: 'Work order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @work_order }
      else
        format.html { render action: 'new' }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        format.html { redirect_to work_orders_url, notice: 'Work order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url }
      format.json { head :no_content }
    end
  end
  
  def complete
    work_orders = WorkOrder.where(id: params[:work_order_ids])

    work_orders.each do |order|
      if order.completion_switch == false
        order.completion_switch = true
      elsif order.completion_switch == true
        order.completion_switch = false 
      end
      order.save!
    end

    redirect_to work_orders_url
  end

  private
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    def work_order_params
      params.require(:work_order).permit(:plantask_id, :start_date, :urgency, :description, :department_id, :due_date, :completion_switch, :user_ids => [])
    end
end
