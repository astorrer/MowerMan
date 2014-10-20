class AddNumberToArea < ActiveRecord::Migration
  def change
    add_column :areas, :number, :integer
  end
end
