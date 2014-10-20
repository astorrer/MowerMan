class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :plantask_id
      t.integer :urgency
      t.text :description

      t.timestamps
    end
  end
end
