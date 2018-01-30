class RenameLikeCountsColumnToCommentCounts < ActiveRecord::Migration[5.0]
  def change
    rename_column :articles, :like_counts, :comment_counts
  end
end
