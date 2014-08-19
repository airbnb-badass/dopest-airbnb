class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.integer :price
      t.references :user, index: true

      t.timestamps
    end
  end
end
