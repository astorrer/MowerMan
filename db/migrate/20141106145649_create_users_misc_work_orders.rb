class CreateUsersMiscWorkOrders < ActiveRecord::Migration
  def change
    create_table :users_misc_work_orders do |t|
      t.integer :misc_work_order_id
      t.integer :user_id

      t.timestamps
    end
  end
end
