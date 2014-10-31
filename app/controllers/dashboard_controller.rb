class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_plantask

  require 'jbuilder'

  def dash
    @total_tasks_count = @plantasks.count

    # Modal Lists
    @page_good    = @plantasks.good.order("updated_at DESC").limit(5)
    @page_warning = @plantasks.warning.order("updated_at DESC").limit(5)
    @page_alerts  = @plantasks.alert.order("updated_at DESC").limit(5)

    # Variables to be parse to javascript via gon
    @good     = @plantasks.good.count
    @warning  = @plantasks.warning.count
    @alert    = @plantasks.alert.count

    # Set these to an instance variable, otherwise the view will load will 'nill'
    gon.watch.good    = @good
    gon.watch.warning = @warning
    gon.watch.alert   = @alert
  end

  def view_good
    @good = @plantasks.good.all
  end

  def view_warnings
    @warnings = @plantasks.warning.all
  end

  def view_alerts
   @alerts = @plantasks.alert.all
  end

  def view_overdue
    @overdue = @plantasks.overdue.all
  end

  #def workloads
  #  @user = User.department(current_user.department_id).all
  #  workloads = Hash.new
  #  @user.each do |user|
  #    workloads[user.name] = Plantask.associated_user(user).associate_workload
  #  end
  #  @array = workloads.collect { |k, v| [k, v] }
  #end

  def status
    good      = @plantasks.good.count
    warning   = @plantasks.warning.count
    alert     = @plantasks.alert.count
    @array    = [['Good', good], ['Warning', warning], ['Alert', alert]]
  end

  def overdue
    overdue   = @plantasks.overdue.count
    remaining = @plantasks.count - overdue
    @array    = [['On Time', remaining], ['Overdue', overdue]] 
  end
  
  private
    def set_plantask
      @plantasks = Plantask.department(current_user.department_id).all
    end 
end
