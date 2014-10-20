class AddMethodToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :method, :string
  end
end
