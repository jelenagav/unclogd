class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :description
      t.string :price_range
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
