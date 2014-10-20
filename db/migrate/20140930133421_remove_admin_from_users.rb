class RemoveAdminFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :system_admin, :boolean
  end
end
