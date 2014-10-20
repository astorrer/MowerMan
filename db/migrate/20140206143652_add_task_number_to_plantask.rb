class AddTaskNumberToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :task_number, :integer
  end
end
