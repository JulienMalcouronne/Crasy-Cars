class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :users, null: false, foreign_key: true
      t.references :cars, null: false, foreign_key: true
      t.datetime :started_date
      t.datetime :end_date
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
