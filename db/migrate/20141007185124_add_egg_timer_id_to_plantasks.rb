class AddEggTimerIdToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :egg_timer_id, :integer
  end
end
