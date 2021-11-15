class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :type
      t.string :address
      t.integer :price
      t.integer :capacity
      t.text :features
      t.text :summary
      t.string :engine

      t.timestamps
    end
  end
end
