class RenameWorkOrdersUsers < ActiveRecord::Migration
  def change
    rename_table :work_orders_users, :users_work_orders
  end
end
