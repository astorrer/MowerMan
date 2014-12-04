class RenamePlantaskMethodToProcedure < ActiveRecord::Migration
  def change
    rename_column :plantasks, :method, :procedure
  end
end
