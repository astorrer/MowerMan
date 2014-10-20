class AddExtUpperAndExtLowerToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :ext_upper, :integer
    add_column :plantasks, :ext_lower, :integer
  end
end
