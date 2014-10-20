class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :status
      t.integer :data
      t.integer :plantask_id

      t.timestamps
    end
  end
end
