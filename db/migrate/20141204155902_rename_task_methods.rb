class RenameTaskMethods < ActiveRecord::Migration
  def self.up
    rename_table :task_methods, :procedures
  end
  
  def self.down
    rename_table :procedures, :task_methods
  end
end
