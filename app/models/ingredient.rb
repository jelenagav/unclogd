class Ingredient < ApplicationRecord
  has_many :ingredient_lists
  has_many :items, through: :ingredient_lists
end
