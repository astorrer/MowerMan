class AddStartDateToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :start_date, :datetime
  end
end
