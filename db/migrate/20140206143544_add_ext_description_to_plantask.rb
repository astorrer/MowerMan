class AddExtDescriptionToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :ext_description, :text
  end
end
