class AddCommentsToRecords < ActiveRecord::Migration
  def change
    add_column :records, :comments, :text
  end
end
