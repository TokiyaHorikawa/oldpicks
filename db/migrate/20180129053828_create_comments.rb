class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content, null:false
      t.references :user, foreign_key: true, index: true
      t.references :articles, foreign_key: true, index: true
      t.timestamps
    end
  end
end
