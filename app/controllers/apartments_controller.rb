class ApartmentsController < ApplicationController

  before_action :authenticate_user!, :only => :new


  def index
    @apartments = Apartment.all
  end

  def show
    @apartment = Apartment.find(params[:id])
    @owner = @apartment.user
  end

  def new
    @apartment = Apartment.new
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user_id = current_user.id
    @apartment.save
    redirect_to apartments_path
  end

  private

  def apartment_params
    params.require(:apartment).permit(:title, :description, :price, :address, :zipcode, :city, :country, :picture)
  end

end
