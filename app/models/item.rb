class Item < ApplicationRecord
  has_many :package_items, dependent: :destroy
  has_many :packages, through: :package_items
  has_many :ingredient_lists
  has_many :ingredients, through: :ingredient_lists

  def price_in_cents
    case price
    when "Cheap"
      10_00
    when "Normal"
      20_00
    when "Expensive"
      35_00
    end
  end
end
