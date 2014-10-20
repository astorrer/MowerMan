class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area

      t.timestamps
    end
  end
end
