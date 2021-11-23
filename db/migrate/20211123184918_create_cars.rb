class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.integer :capacity
      t.float :rating
      t.string :picture_url

      t.timestamps
    end
  end
end
