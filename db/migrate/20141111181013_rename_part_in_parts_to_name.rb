class RenamePartInPartsToName < ActiveRecord::Migration
  def change
    rename_column :parts, :part, :name
  end
end
