class Product < ApplicationRecord
  belongs_to :category

  monetize :price_cents

  validates_presence_of :name, :sku
end
