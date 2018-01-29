class AddLikeCountsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :like_counts, :integer
  end
end
