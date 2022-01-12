class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category
      t.string :sku
      t.monetize :price
      
      t.timestamps
    end
  end
end
