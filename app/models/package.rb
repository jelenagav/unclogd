class Package < ApplicationRecord
  has_many :package_items
  has_many :items, through: :package_items
  belongs_to :user
end
