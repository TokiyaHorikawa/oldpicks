class RemoveArticleIdToLikes < ActiveRecord::Migration[5.0]
  def change
    remove_reference :likes, :article, foreign_key: true, index: true
  end
end
