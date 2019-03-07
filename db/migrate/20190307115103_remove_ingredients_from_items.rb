class RemoveIngredientsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ingredients
  end
end
