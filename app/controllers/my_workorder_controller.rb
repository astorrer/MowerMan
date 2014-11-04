class MyWorkorderController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_workorders

  def myworkorders
  end
  
  def set_workorders
    @work_orders = current_user.work_orders.all
  end
end
