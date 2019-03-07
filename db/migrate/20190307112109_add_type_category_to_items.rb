class AddTypeCategoryToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :type_category, :string
  end
end
