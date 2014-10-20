class AddOccuranceRulesToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :occurance_count, :integer
    add_column :plantasks, :assigned_switch, :boolean
  end
end
