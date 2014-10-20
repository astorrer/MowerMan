class CreateEggTimers < ActiveRecord::Migration
  def change
    create_table :egg_timers do |t|
      t.string :kind
      t.integer :assign_time
      t.integer :overdue_time

      t.timestamps
    end
  end
end
