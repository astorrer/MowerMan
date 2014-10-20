class AddNumberToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :number, :integer
  end
end
