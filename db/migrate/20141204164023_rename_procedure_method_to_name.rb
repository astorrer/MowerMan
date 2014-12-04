class RenameProcedureMethodToName < ActiveRecord::Migration
  def change
    rename_column :procedures, :method, :name
  end
end
