class ChangeUserIdOnCars < ActiveRecord::Migration[6.0]
  def change
        remove_reference :cars, :users, foreign_key: true
        add_reference :cars, :user, foreign_key: true
  end
end
