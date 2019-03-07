class AddProductCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :product_category, :string
  end
end
