class ProceduresController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_procedures, only: [:edit, :update, :destroy]

  def new
    @procedure = Procedure.new
  end

  def edit
  end

  def create
    @procedure = Procedure.new(task_params)
    respond_to do |format|
      if @procedure.save
        format.html { redirect_to libraries_path, notice: 'Procedure was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @procedure.update(task_params)
        format.html { redirect_to libraries_path, notice: 'Procedure was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @procedure.destroy    
    respond_to do |format|
      format.html { redirect_to libraries_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedures
      @procedure = Procedure.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:procedure).permit(:name)
    end
end