class AddEquipNumberToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :equip_number, :integer
  end
end
