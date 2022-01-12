class DiscountRule < ApplicationRecord
  validates_presence_of :name, :description, :discount_percentage, :minimum_items
end
