class PartsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_part, only: [:edit, :update, :destroy]

  def new
    @part = Part.new
  end

  def edit
  end

  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to libraries_path, notice: 'Part was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to libraries_path, notice: 'Part was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to libraries_path }
    end
  end

  private
    def set_part
      @part = Part.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:part)
    end
end
