class Item < ApplicationRecord
  has_many :package_items
  has_many :packages, through: :package_items
  has_many :ingredient_lists
  has_many :ingredients, through: :ingredient_lists
end
