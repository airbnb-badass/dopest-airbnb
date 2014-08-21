class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.integer :guests

      t.timestamps
    end
  end
end
