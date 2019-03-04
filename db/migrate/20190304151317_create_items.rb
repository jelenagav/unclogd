class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :ingredients
      t.string :cruelty
      t.string :price
      t.string :brand
      t.string :picture_url

      t.timestamps
    end
  end
end
