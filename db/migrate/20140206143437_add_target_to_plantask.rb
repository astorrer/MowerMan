class AddTargetToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :target, :integer
  end
end
