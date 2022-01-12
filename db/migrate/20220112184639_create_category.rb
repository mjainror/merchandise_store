class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    Category.create([  
      { name: "MUG" },
      { name: "TSHIRT" },
      { name: "HOODIE" }
    ])
  end
end
