class CreateDiscount < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.references :discount_rule
      t.integer :discountable_id
      t.string :discountable_type

      t.timestamps
    end
  end
end
