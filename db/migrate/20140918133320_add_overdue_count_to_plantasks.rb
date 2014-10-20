class AddOverdueCountToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :overdue_count, :integer
  end
end
