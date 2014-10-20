class CreatePlantasks < ActiveRecord::Migration
  def change
    create_table :plantasks do |t|
      t.string :area
      t.string :equipment
      t.string :part
      t.text :description
      t.text :date
      t.string :data_type
      t.integer :upper
      t.integer :lower
      t.string :current_status

      t.timestamps
    end
  end
end
