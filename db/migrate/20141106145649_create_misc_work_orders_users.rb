class CreateMiscWorkOrdersUsers < ActiveRecord::Migration
  def change
    create_table :misc_work_orders_users, id: false do |t|
      t.belongs_to :misc_work_order
      t.belongs_to :user
    end
  end
end
