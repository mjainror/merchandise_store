class CreateDiscountRule < ActiveRecord::Migration[6.1]
  def change
    create_table :discount_rules do |t|
      t.string :name
      t.text :description
      t.decimal :discount_percentage
      t.integer :minimum_items
      
      t.timestamps
    end
  end
end
