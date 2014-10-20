class CreateTaskHistories < ActiveRecord::Migration
  def change
    create_table :task_histories do |t|
      t.integer :task_count
      t.integer :overdue_count

      t.timestamps
    end
  end
end
