class AddColumnToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :title, :string, null: false
    add_column :articles, :description, :string, null: false
    add_column :articles, :image, :string, null: false
    add_column :articles, :site_name, :string, null: false
  end
end
