class EquipmentController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_equipment, only: [:edit, :update, :destroy]

  def new
    @equipment = Equipment.new
  end

  def edit
  end

  def create
    @equipment = Equipment.new(equipment_params)

    respond_to do |format|
      if @equipment.save
        format.html { redirect_to libraries_path, notice: 'Equipment was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to libraries_path, notice: 'Equipment was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to libraries_path }
    end
  end

  private
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    def equipment_params
      params.require(:equipment).permit(:name, :number)
    end
end
