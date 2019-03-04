class CreatePackageItems < ActiveRecord::Migration[5.2]
  def change
    create_table :package_items do |t|
      t.references :package, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
