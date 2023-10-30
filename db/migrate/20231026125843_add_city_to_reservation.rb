class AddCityToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :city, null: false, foreign_key: true
  end
end
