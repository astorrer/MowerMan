class AddDepartmentIdToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :department_id, :integer, default: 1
  end
end
