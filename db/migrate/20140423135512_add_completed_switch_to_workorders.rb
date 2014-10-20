class AddCompletedSwitchToWorkorders < ActiveRecord::Migration
  def change
    add_column :work_orders, :completion_switch, :boolean
  end
end
