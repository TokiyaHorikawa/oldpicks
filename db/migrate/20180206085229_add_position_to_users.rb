class AddPositionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company, :string
    add_column :users, :position, :string
    add_column :users, :profile, :text
  end
end
