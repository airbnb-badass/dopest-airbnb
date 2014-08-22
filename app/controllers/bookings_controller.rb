class BookingsController < ApplicationController

# def index
  # @apartment = Apartment.find(params[:apartment_id])
  # @bookings = Booking.find(params[:apartment_id])
# end

def create
  @apartment = Apartment.find(params[:apartment_id])
  @booking = @apartment.bookings.create(booking_params)
  @booking.status = "pending"
  @booking.user_id = current_user.id
  @booking.save
  @user = @booking.apartment.user
  UserMailer.new_booking_message(@user).deliver
  redirect_to apartment_path(@apartment)
end

def validate
  @booking = Booking.find(params[:id])
  @booking.status = "validated"
  @booking.save
  @user = @booking.user
  UserMailer.validation_message(@user).deliver
  redirect_to bookings_path
end


def cancel
  @booking = Booking.find(params[:id])
  @booking.status = "canceled"
  @booking.save
  @user = @booking.user
  UserMailer.cancel_message(@user).deliver
  redirect_to bookings_path
end

private

def booking_params
  params.require(:booking).permit(:checkin, :checkout, :guests)
end


end
