class Product < ApplicationRecord
  belongs_to :category

  monetize :price_cents

  validates_presence_of :name, :sku

  delegate :name, to: :category, allow_nil: true, prefix: true
end
