class CreateMiscWorkOrders < ActiveRecord::Migration
  def change
    create_table :misc_work_orders do |t|
      t.integer :account_number
      t.string :cost_unit
      t.string :cost_center
      t.text :cost_description
      t.datetime :start_date
      t.datetime :due_date
      t.text :description
      t.integer :urgency
      t.boolean :completion_switch

      t.timestamps
    end
  end
end
