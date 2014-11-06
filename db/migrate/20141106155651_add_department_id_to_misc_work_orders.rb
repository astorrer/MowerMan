class AddDepartmentIdToMiscWorkOrders < ActiveRecord::Migration
  def change
    add_column :misc_work_orders, :department_id, :integer
  end
end
