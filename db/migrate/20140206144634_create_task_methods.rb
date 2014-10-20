class CreateTaskMethods < ActiveRecord::Migration
  def change
    create_table :task_methods do |t|
      t.string :method

      t.timestamps
    end
  end
end
