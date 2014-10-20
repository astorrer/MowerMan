class AddDepartmentIdToPlantasks < ActiveRecord::Migration
  def change
    add_column :plantasks, :department_id, :integer
  end
end
