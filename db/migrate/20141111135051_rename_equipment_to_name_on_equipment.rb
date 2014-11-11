class RenameEquipmentToNameOnEquipment < ActiveRecord::Migration
  def change
    rename_column :equipment, :equipment, :name
  end
end
