class Item < ApplicationRecord
  has_many :packages, through: :package_items
end
