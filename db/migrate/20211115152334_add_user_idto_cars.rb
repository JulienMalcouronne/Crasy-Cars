class AddUserIdtoCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :users, foreign_key: true
  end
end
