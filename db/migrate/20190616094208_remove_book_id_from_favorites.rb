class RemoveBookIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :name, :integer
  end
end
