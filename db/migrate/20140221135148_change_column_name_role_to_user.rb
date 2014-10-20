class ChangeColumnNameRoleToUser < ActiveRecord::Migration
  def up
    rename_column :users, :role, :admin
  end
  
  def down
    rename_column :users, :admin, :role
  end
end
