class CreateMiscWorkOrdersUsers < ActiveRecord::Migration
  def change
    create_table :misc_work_orders_users do |t|
      t.integer :misc_work_order
      t.integer :user

      t.timestamps
    end
  end
end
