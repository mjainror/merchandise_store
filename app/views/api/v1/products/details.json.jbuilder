json.items @products.map(&:name).join(", ")
json.total humanized_money_with_symbol(@products.map(&:price).sum)
json.count @products.size

json.products do
  json.partial! 'api/v1/products/product', collection: @products, as: :product
end
