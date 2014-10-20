class AddTickleAtrToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :next_occurrence, :datetime
    add_column :plantasks, :tickle_expression, :string
  end
end
