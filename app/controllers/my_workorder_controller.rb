class MyWorkorderController < ApplicationController
  before_filter :authenticate_user!

  def myworkorders
    @work_orders = current_user.work_orders.all
  end
end
