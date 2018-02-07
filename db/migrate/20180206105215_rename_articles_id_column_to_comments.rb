class RenameArticlesIdColumnToComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :articles_id, :article_id
  end
end
