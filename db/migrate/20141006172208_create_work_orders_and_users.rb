class CreateWorkOrdersAndUsers < ActiveRecord::Migration
    create_table :work_orders_users, id: false do |t|
      t.belongs_to :work_order
      t.belongs_to :user
    end
end
