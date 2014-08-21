class Booking < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :user

  has_one :owner,
    class_name: 'User',
    through: :apartment,
    source: :user
end
