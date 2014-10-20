class AddEstTimeToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :est_time, :integer
  end
end
