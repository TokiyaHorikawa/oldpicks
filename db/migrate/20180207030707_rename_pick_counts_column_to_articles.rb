class RenamePickCountsColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :pick_counts, :comment_counts
  end
end
