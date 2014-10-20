class AddMostRecentCommentToPlantask < ActiveRecord::Migration
  def change
    add_column :plantasks, :most_recent_comment, :text
  end
end
