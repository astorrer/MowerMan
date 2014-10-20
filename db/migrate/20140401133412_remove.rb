class Remove < ActiveRecord::Migration
  def change
    remove_column :plantasks, :task_number
  end
end
