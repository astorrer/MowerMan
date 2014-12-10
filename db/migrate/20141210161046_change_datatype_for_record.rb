class ChangeDatatypeForRecord < ActiveRecord::Migration
  def change
    change_table :records do |t|
      t.change :data, :decimal
    end
  end
end
