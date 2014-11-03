class TaskMethodsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_task_methods, only: [:edit, :update, :destroy]
  
  def new
    @task_method = TaskMethod.new
  end
  
  def edit
  end
  
  def create
    @task_method = TaskMethod.new(task_params)
    respond_to do |format|
      if @task_method.save
        format.html { redirect_to libraries_path, notice: 'Method was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update   
    respond_to do |format|
      if @task_method.update(task_params)
        format.html { redirect_to libraries_path, notice: 'Method was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end 
  end
  
  def destroy
    @task_method.destroy    
    respond_to do |format|
      format.html { redirect_to libraries_path }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_methods
      @task_method = TaskMethod.find(params[:id]) 
    end
      
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task_method).permit(:method)
    end
end