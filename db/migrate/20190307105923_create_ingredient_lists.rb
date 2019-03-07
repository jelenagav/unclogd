class CreateIngredientLists < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredient_lists do |t|
      t.references :ingredient, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
