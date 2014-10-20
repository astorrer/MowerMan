class AddAssoicateToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :associate, :string
  end
end
