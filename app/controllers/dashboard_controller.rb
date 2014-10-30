class DashboardController < ApplicationController
  before_filter :authenticate_user!
  require 'jbuilder'

  def dash
    @plantasks         = Plantask.department(current_user.department_id).all
    @total_tasks_count = @plantasks.count

    # Modal Lists
    @page_good    = @plantasks.good.order("updated_at DESC").limit(5)
    @page_warning = @plantasks.warning.order("updated_at DESC").limit(5)
    @page_alerts  = @plantasks.alert.order("updated_at DESC").limit(5)

    # Variables to be parse to javascript via gon
    @good     = Plantask.department(current_user.department_id).good.count
    @warning  = Plantask.department(current_user.department_id).warning.count
    @alert    = Plantask.department(current_user.department_id).alert.count  
    gon.watch.good    = @good
    gon.watch.warning = @warning
    gon.watch.alert   = @alert
  end

  def workloads
    @user = User.department(current_user.department_id).all
    workloads = Hash.new
    @user.each do |user|
      workloads[user.name] = Plantask.associated_user(user).associate_workload
    end
    @array = workloads.collect { |k, v| [k, v] }
  end

  def status
    plantask  = Plantask.department(current_user.department_id).all
    good      = plantask.good.count
    warning   = plantask.warning.count
    alert     = plantask.alert.count
    @array    = [['Good', good], ['Warning', warning], ['Alert', alert]]
  end

  def overdue
    plantasks = Plantask.department(current_user.department_id).all
    overdue   = plantasks.overdue.count
    remaining = plantasks.count - overdue
    @array    = [['On Time', remaining], ['Overdue', overdue]] 
  end
end
