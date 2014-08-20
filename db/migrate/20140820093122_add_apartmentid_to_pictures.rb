class AddApartmentidToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :apartment, index: true
  end
end
