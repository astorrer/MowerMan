class RemoveOccuranceCountFromPlantask < ActiveRecord::Migration
  def up
    remove_column :plantasks, :occurance_count
  end
  
  def down
    add_column :plantasks, :occurance_count, :integer
  end
end
