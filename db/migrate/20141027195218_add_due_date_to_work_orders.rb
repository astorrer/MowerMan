class AddDueDateToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :due_date, :datetime
  end
end
