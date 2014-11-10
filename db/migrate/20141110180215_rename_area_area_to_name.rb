class RenameAreaAreaToName < ActiveRecord::Migration
  def change
    rename_column :areas, :area, :name
  end
end
