class AreasController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_area, only: [:edit, :update, :destroy]

  def new
    @area = Area.new
  end

  def edit
  end

  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to libraries_path, notice: 'Area was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to libraries_path, notice: 'Area was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to libraries_path }
    end
  end

  private
    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:name, :number)
    end
end