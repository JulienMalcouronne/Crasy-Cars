class ChangeIdsonReservation < ActiveRecord::Migration[6.0]
  def change
      remove_reference :reservations, :users, foreign_key: true
      add_reference :reservations, :user, foreign_key: true
      remove_reference :reservations, :cars, foreign_key: true
      add_reference :reservations, :car, foreign_key: true
  end
end
