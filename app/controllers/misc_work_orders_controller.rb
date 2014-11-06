class MiscWorkOrdersController < ApplicationController
  before_action :set_misc_work_order, only: [:show, :edit, :update, :destroy]

  # GET /misc_work_orders
  # GET /misc_work_orders.json
  def index
    @misc_work_orders = MiscWorkOrder.all
  end

  # GET /misc_work_orders/1
  # GET /misc_work_orders/1.json
  def show
  end

  # GET /misc_work_orders/new
  def new
    @misc_work_order = MiscWorkOrder.new(:urgency => '1', :department_id => current_user.department_id) 
  end

  # GET /misc_work_orders/1/edit
  def edit
  end

  # POST /misc_work_orders
  # POST /misc_work_orders.json
  def create
    @misc_work_order = MiscWorkOrder.new(misc_work_order_params)

    respond_to do |format|
      if @misc_work_order.save
        format.html { redirect_to @misc_work_order, notice: 'Misc work order was successfully created.' }
        format.json { render :show, status: :created, location: @misc_work_order }
      else
        format.html { render :new }
        format.json { render json: @misc_work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /misc_work_orders/1
  # PATCH/PUT /misc_work_orders/1.json
  def update
    respond_to do |format|
      if @misc_work_order.update(misc_work_order_params)
        format.html { redirect_to @misc_work_order, notice: 'Misc work order was successfully updated.' }
        format.json { render :show, status: :ok, location: @misc_work_order }
      else
        format.html { render :edit }
        format.json { render json: @misc_work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /misc_work_orders/1
  # DELETE /misc_work_orders/1.json
  def destroy
    @misc_work_order.destroy
    respond_to do |format|
      format.html { redirect_to misc_work_orders_url, notice: 'Misc work order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_misc_work_order
      @misc_work_order = MiscWorkOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def misc_work_order_params
      params.require(:misc_work_order).permit(:account_number, :cost_unit, :cost_center, :cost_description, :start_date, :due_date, :description, :urgency, :completion_switch)
    end
end
