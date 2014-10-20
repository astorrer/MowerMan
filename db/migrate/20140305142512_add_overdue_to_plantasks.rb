class AddOverdueToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :overdue, :boolean
  end
end
