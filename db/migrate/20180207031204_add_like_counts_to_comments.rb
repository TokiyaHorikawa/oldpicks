class AddLikeCountsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :like_counts, :integer
  end
end
