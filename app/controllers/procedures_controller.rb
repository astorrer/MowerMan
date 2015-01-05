class ProceduresController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_procedure, only: [:edit, :update, :destroy]

  def new
    @procedure = Procedure.new
  end

  def edit
  end

  def create
    @procedure = Procedure.new(procedure_params)

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
      if @procedure.update(procedure_params)
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
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def procedure_params
      
      params.require(:procedure).permit(:name)
    end
end