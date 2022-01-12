json.(product, :id, :name, :sku, :description, :category_id, :category_name)
json.price humanized_money_with_symbol(product.price)
