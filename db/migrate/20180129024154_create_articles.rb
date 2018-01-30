class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :url, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
