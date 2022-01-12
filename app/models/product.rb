class Product < ApplicationRecord
  belongs_to :category

  has_many :discounts

  monetize :price_cents

  validates_presence_of :name, :sku

  delegate :name, to: :category, allow_nil: true, prefix: true

  class << self
    def get_cart_details(opts = [])
      rqst = {}
      opts.each{|e| rqst[e[:id].to_i] = e[:quantity] }

      products = Product.where(id: rqst.keys)
      total_count = 0
      total_price = 0.0
      items = []

      res = products.map do |product|
        product_quantity = rqst[product.id].to_i

        product_quantity.times do 
          items.push(product.category_name)
        end

        discount         = product.get_discount_rule_and_price(product_quantity)
        discount_rule    = discount[0]
        discount_price   = discount[1]
        product_price    = (product.price_cents * product_quantity) - discount_price
        total_price     += product_price
        total_count     += product_quantity

        product.as_json(
          only: %w(id name sku description category_id)
        ).merge(
          category_name: product.category_name,
          quantity: product_quantity,
          price: ActionController::Base.helpers.humanized_money_with_symbol(Money.new(product.price_cents)),
          discount_rule: discount_rule,
          discount_price: ActionController::Base.helpers.humanized_money_with_symbol(Money.new(discount_price)),
          total_price: ActionController::Base.helpers.humanized_money_with_symbol(Money.new(product_price))
        )
      end

      {
        items: items.join(", "),
        total: ActionController::Base.helpers.humanized_money_with_symbol(Money.new(total_price)),
        count: total_count,
        products: res
      }
    end
  end

  def get_discount_rule_and_price(quantity)
    rule = self.category.discount_rules.first

    discount_price = (rule.present? && rule.minimum_items <= quantity) ? (self.price_cents * rule.discount_percentage/100.00) : 0.00

    [rule&.name, discount_price]
  end
end
