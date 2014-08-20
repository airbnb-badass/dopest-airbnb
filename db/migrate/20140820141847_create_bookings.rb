class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :checkin
      t.date :checkout
      t.integer :guests
      t.string :status
      t.references :apartment, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
