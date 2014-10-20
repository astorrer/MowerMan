class RemoveTickleExpressionFromPlantask < ActiveRecord::Migration
  def up
    remove_column :plantasks, :tickle_expression
  end
  
  def down
    add_column :plantasks, :tickle_expression, :string
  end
end
