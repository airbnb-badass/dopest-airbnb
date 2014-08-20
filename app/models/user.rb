class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :apartments

  has_many :bookings

  has_many :apartment_bookings,
    class_name: 'Booking',
    through: :apartments,
    source: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
