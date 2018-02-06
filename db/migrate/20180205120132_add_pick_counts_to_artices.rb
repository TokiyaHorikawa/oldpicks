class AddPickCountsToArtices < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :pick_counts, :integer
  end
end
