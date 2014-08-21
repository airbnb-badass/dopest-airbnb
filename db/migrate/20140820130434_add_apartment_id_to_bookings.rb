class AddApartmentIdToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :apartment, index: true
  end
end
